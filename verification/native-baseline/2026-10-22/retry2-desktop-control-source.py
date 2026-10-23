"""Shared desktop-control lock (Astris Hangul PC capture <-> Web HWP). stdlib only, Windows.

Mutual exclusion = an OS byte-range lock: msvcrt.locking(fd, LK_NBLCK, 1) on byte 0 of the permanent file
desktop-control.lock (never replaced, never deleted). The OS drops the lock when the holder process ends, so a crash
can never leave a stuck lock. desktop-control.owner.json (temp file + os.replace) only *describes* the holder:
{owner, session, job, pid, since, heartbeat, token}; heartbeat every 30 s while held. A heartbeat older than 5 minutes
is only flagged (stale_suspect) - nothing is ever reclaimed automatically: the lock is taken over only when the OS lock
can really be acquired (holder dead / released).

A wish to take the screen = desktop-control.request, created with O_CREAT|O_EXCL: {owner, session, token, pid,
requested_at, reason, max_seconds}. Only the requester removes it (cancel_request with its own token). A holder checks
pending_request() at its safe points, releases, waits until the request is gone, then acquires again; acquire() itself
waits while someone else's request is pending (fairness) - however old it looks (expired_suspect is a diagnosis only,
never a bypass). An empty / half-written / unparsable request file counts as pending and unreadable (fail closed).
release() publishes owner=None while the OS lock is still held, then unlocks (a new owner can never be overwritten).

API: acquire(owner, session, job, timeout=None, request_token=None) -> token      release(token)
     heartbeat(token)      holds(token) -> bool      current_owner() -> dict | None
     pending_request() -> dict | None      request(owner, session, reason, max_seconds) -> token | None
     cancel_request(token) -> bool
"""
import json
import msvcrt
import os
import threading
import time
import uuid

DIR = os.environ.get("DESKTOP_CONTROL_DIR") or os.path.dirname(os.path.abspath(__file__))   # env override = tests only
LOCK = os.path.join(DIR, "desktop-control.lock")
OWNER = os.path.join(DIR, "desktop-control.owner.json")
REQUEST = os.path.join(DIR, "desktop-control.request")
HEARTBEAT_EVERY = 30
STALE_AFTER = 300
REQUEST_EXPIRED_EXTRA = 600     # seconds beyond max_seconds after which a lingering request is only *flagged* expired_suspect

_held = {}                      # token -> dict(fd, info, stop)
_mu = threading.Lock()


def _now():
    return time.time()


def _iso(t=None):
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(t or _now()))


def _publish(obj):
    tmp = f"{OWNER}.{os.getpid()}.{uuid.uuid4().hex[:6]}.tmp"
    with open(tmp, "w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=1)
    os.replace(tmp, OWNER)


def _read_json(path):
    try:
        with open(path, encoding="utf-8") as f:
            return json.load(f)
    except (FileNotFoundError, ValueError, OSError):
        return None


def current_owner():
    """owner.json content plus age/stale flag; None when never published. owner=None means released."""
    d = _read_json(OWNER)
    if d is None:
        return None
    if d.get("owner") and d.get("heartbeat"):
        d["heartbeat_age_s"] = round(_now() - d["heartbeat"], 1)
        d["stale_suspect"] = d["heartbeat_age_s"] > STALE_AFTER
    return d


def pending_request():
    """None = no request file. A file that is empty, partly written or not a JSON object is reported as
    {"unreadable": True, ...} and must be treated as a pending request (fail closed)."""
    try:
        with open(REQUEST, encoding="utf-8") as f:
            raw = f.read()
    except FileNotFoundError:
        return None
    except OSError as e:
        return dict(unreadable=True, error=repr(e), token=None, owner=None)
    try:
        d = json.loads(raw)
        if not isinstance(d, dict) or not d.get("token"):
            raise ValueError("not a complete request object")
    except ValueError as e:
        return dict(unreadable=True, error=repr(e), token=None, owner=None, bytes=len(raw))
    d["age_s"] = round(_now() - d.get("requested_at", _now()), 1)
    d["expired_suspect"] = d["age_s"] > d.get("max_seconds", 0) + REQUEST_EXPIRED_EXTRA   # diagnosis only
    return d


def _beat(token):
    h = _held.get(token)
    if not h:
        return False
    h["info"]["heartbeat"] = _now()
    h["info"]["heartbeat_iso"] = _iso()
    _publish(h["info"])
    return True


def heartbeat(token):
    with _mu:
        return _beat(token)


def _beat_loop(token, stop):
    while not stop.wait(HEARTBEAT_EVERY):
        try:
            with _mu:
                if not _beat(token):
                    return
        except Exception:
            pass


def holds(token):
    return token in _held


def _foreign(req, request_token):
    return req is not None and (req.get("unreadable") or req.get("token") != request_token)


def acquire(owner, session, job, timeout=None, request_token=None, poll=0.5):
    """Block until the OS lock is ours. Raises TimeoutError. request_token: the caller's own pending request (it may
    pass its own request; everyone else waits while any foreign / unreadable request is pending, however old)."""
    t0 = _now()
    while True:
        foreign = _foreign(pending_request(), request_token)
        if not foreign:
            fd = os.open(LOCK, os.O_RDWR | os.O_CREAT)
            locked = False
            try:
                os.lseek(fd, 0, 0)
                msvcrt.locking(fd, msvcrt.LK_NBLCK, 1)
                locked = True
            except OSError:
                os.close(fd)
            if locked:
                token = uuid.uuid4().hex
                info = dict(owner=owner, session=session, job=job, pid=os.getpid(), since=_now(), since_iso=_iso(),
                            heartbeat=_now(), heartbeat_iso=_iso(), token=token)
                stop = threading.Event()
                try:
                    with _mu:
                        _held[token] = dict(fd=fd, info=info, stop=stop)
                        _publish(info)
                    threading.Thread(target=_beat_loop, args=(token, stop), daemon=True).start()
                    # a request may have been created between the check and the lock: look again right after acquiring
                    if _foreign(pending_request(), request_token):
                        release(token)
                        foreign = True
                    else:
                        return token
                except BaseException:
                    with _mu:
                        h = _held.pop(token, None)
                    stop.set()
                    try:
                        os.lseek(fd, 0, 0)
                        msvcrt.locking(fd, msvcrt.LK_UNLCK, 1)
                    except OSError:
                        pass
                    try:
                        os.close(fd)
                    except OSError:
                        pass
                    raise
        if timeout is not None and _now() - t0 >= timeout:
            raise TimeoutError("desktop-control lock not acquired" + (" (foreign request pending)" if foreign else ""))
        time.sleep(poll)


def release(token):
    """owner=None is published while the OS lock is still held, then the lock is dropped."""
    with _mu:
        h = _held.pop(token, None)
        if not h:
            return False
        h["stop"].set()
        try:
            _publish(dict(owner=None, released_at=_now(), released_iso=_iso(),
                          last=dict(owner=h["info"]["owner"], job=h["info"]["job"], session=h["info"]["session"],
                                    pid=h["info"]["pid"])))
        finally:
            try:
                os.lseek(h["fd"], 0, 0)
                msvcrt.locking(h["fd"], msvcrt.LK_UNLCK, 1)
            finally:
                os.close(h["fd"])
        return True


def request(owner, session, reason, max_seconds):
    """Create the request file (exclusive). Returns the token, or None when a request already exists."""
    token = uuid.uuid4().hex
    rec = dict(owner=owner, session=session, token=token, pid=os.getpid(), requested_at=_now(), requested_iso=_iso(),
               reason=reason, max_seconds=max_seconds)
    try:
        fd = os.open(REQUEST, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
    except FileExistsError:
        return None
    with os.fdopen(fd, "w", encoding="utf-8") as f:
        json.dump(rec, f, ensure_ascii=False, indent=1)
    return token


def cancel_request(token):
    """Delete the request only if it carries this token (only the requester removes its request)."""
    d = _read_json(REQUEST)
    if d is None or d.get("token") != token:
        return False
    try:
        os.remove(REQUEST)
    except FileNotFoundError:
        return False
    return True


def wait_request_gone(poll=1.0, should_abort=None, log=None):
    """Holder side: after release(), wait until the pending request is really gone (an expired-looking or unreadable
    request is still waited for; only its requester removes it)."""
    seen = False
    while True:
        r = pending_request()
        if r is None:
            return
        if not seen and log:
            log(f"request pending from {r.get('owner')}/{r.get('session')} reason={r.get('reason')!r}"
                + (" (unreadable file, waiting)" if r.get("unreadable") else "") + (" (looks expired, still waiting)" if r.get("expired_suspect") else ""))
            seen = True
        if should_abort and should_abort():
            raise SystemExit("abort while waiting for desktop request to clear")
        time.sleep(poll)
