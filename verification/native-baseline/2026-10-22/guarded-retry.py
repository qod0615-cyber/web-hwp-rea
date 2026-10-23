"""One request, one synchronous native capture attempt. No COM and no resident-worker commands."""
import os, sys, time, json, pathlib, datetime, hashlib, importlib.util, ctypes as C
import ctypes.wintypes as W
import win32gui as g, win32api as a, win32process as p, win32con as k, win32ui
from PIL import Image, ImageGrab
R=pathlib.Path(__file__).resolve().parent
REPORT_PATH=R/'retry2-guarded-retry-report.json'
MANIFEST_PATH=R/'retry2-manifest.json'
if '--authorized-retry2' not in sys.argv:
    raise SystemExit('Not started: await explicit Astris release confirmation and retry2 authorization; no module import/request/UI performed.')
if REPORT_PATH.exists() or MANIFEST_PATH.exists() or any(R.glob('retry2-*.raw.png')):
    raise SystemExit('retry2 artifacts already exist; refusing overwrite or repeated attempt.')
S=pathlib.Path(r'C:\Users\K\.orca\coordination\desktop_control.py')
UP=pathlib.Path(r'C:\Users\K\AppData\Local\Astris\HancomBridge\Jobs\rea_upper\upper-0051')
u=C.windll.user32
u.SetProcessDpiAwarenessContext(C.c_void_p(-4))
def stamp(): return datetime.datetime.now().astimezone().isoformat()
def read(path):
    try: return json.loads(path.read_text(encoding='utf-8-sig'))
    except Exception as e: return {'read_error':repr(e)}
def save(path,obj):
    tmp=path.with_suffix(path.suffix+'.guarded-tmp'); tmp.write_text(json.dumps(obj,ensure_ascii=False,indent=2),encoding='utf-8'); os.replace(tmp,path)
report=dict(started=stamp(),pid=os.getpid(),source=str(S),source_sha256=hashlib.sha256(S.read_bytes()).hexdigest(),events=[],captures=[],status='starting',ui_input_active=False,baseline_worker_commands_sent=False,com_used=False)
report['collector_source']=str(pathlib.Path(__file__).resolve())
report['collector_sha256']=hashlib.sha256(pathlib.Path(__file__).read_bytes()).hexdigest()
report['shared_source_snapshot']='retry2-desktop-control-source.py'
(R/report['shared_source_snapshot']).write_bytes(S.read_bytes())
report['preserved_evidence_sha256']={n:hashlib.sha256((R/n).read_bytes()).hexdigest() for n in ['manifest.json','guarded-retry-report.json']}
manifest=read(R/'manifest.json')
hwnd=manifest['dedicated_hwnd']; pid=manifest['dedicated_pid']
request_token=lock_token=None; down=False; active_until=0
def event(event_kind,**kw):
    report['events'].append(dict(event=event_kind,time=stamp(),epoch=time.time(),**kw)); save(REPORT_PATH,report)
def persist():
    manifest['retry2_guarded_retry']=report
    save(MANIFEST_PATH,manifest); save(REPORT_PATH,report)
if os.environ.get('DESKTOP_CONTROL_DIR'):
    raise RuntimeError('DESKTOP_CONTROL_DIR override present; refusing production lock import')
spec=importlib.util.spec_from_file_location('web_hwp_shared_desktop_control',S)
dc=importlib.util.module_from_spec(spec); spec.loader.exec_module(dc)
def related(h):
    if not h:return False
    return p.GetWindowThreadProcessId(h)[1]==pid and (h==hwnd or g.GetAncestor(h,3)==hwnd)
class GTI(C.Structure):
    _fields_=[('cbSize',W.DWORD),('flags',W.DWORD),('hwndActive',W.HWND),('hwndFocus',W.HWND),('hwndCapture',W.HWND),('hwndMenuOwner',W.HWND),('hwndMoveSize',W.HWND),('hwndCaret',W.HWND),('rcCaret',W.RECT)]
u.GetGUIThreadInfo.argtypes=[W.DWORD,C.POINTER(GTI)]
u.GetGUIThreadInfo.restype=W.BOOL
def menu_state():
    info=GTI(); info.cbSize=C.sizeof(info)
    thread,target_pid=p.GetWindowThreadProcessId(hwnd)
    if not u.GetGUIThreadInfo(thread,C.byref(info)):
        raise RuntimeError('GetGUIThreadInfo failed; menu state unknown')
    return dict(thread=thread,pid=target_pid,flags=info.flags,active=info.hwndActive,focus=info.hwndFocus,capture=info.hwndCapture,menu_owner=info.hwndMenuOwner,in_menu=bool(info.flags&4),system_menu=bool(info.flags&8),popup_menu=bool(info.flags&16))
def normalize_own_system_menu():
    assert_lock(); state=menu_state(); event('menu_observed',state=state,foreground=g.GetForegroundWindow())
    assert g.GetForegroundWindow()==hwnd and state['active']==hwnd,'dedicated editor not active; refusing input to related modal or other document'
    if not(state['in_menu'] or state['system_menu'] or state['popup_menu']):return state
    assert g.GetForegroundWindow()==hwnd and state['active']==hwnd and state['menu_owner']==hwnd and state['system_menu'],'menu ownership/type not proven; refusing Escape to other menu or popup'
    # Exactly one Escape chord, only to this dedicated foreground system menu.
    assert_lock()
    a.keybd_event(k.VK_ESCAPE,0,0,0)
    try: pass
    finally:a.keybd_event(k.VK_ESCAPE,0,k.KEYEVENTF_KEYUP,0)
    event('own_system_menu_escape',hwnd=hwnd); time.sleep(.15)
    after=menu_state(); event('menu_after_escape',state=after)
    assert not(after['in_menu'] or after['system_menu'] or after['popup_menu']),'own system menu did not clear; no repeated Escape'
    return after
def activate_by_title_once():
    global down
    assert_lock(); left,top,right,bottom=g.GetWindowRect(hwnd)
    title_height=max(24,u.GetSystemMetrics(4)+2*u.GetSystemMetrics(33))
    sx=(left+right)//2; sy=top+title_height//2
    hit=g.WindowFromPoint((sx,sy)); root=g.GetAncestor(hit,2)
    assert root==hwnd and p.GetWindowThreadProcessId(hit)[1]==pid,'title center does not hit dedicated window; no click'
    event('title_click_verified',screen=[sx,sy],window_rect=[left,top,right,bottom],title_height=title_height,hit_hwnd=hit,root_hwnd=root)
    a.SetCursorPos((sx,sy)); assert_lock()
    assert g.GetAncestor(g.WindowFromPoint((sx,sy)),2)==hwnd,'title ownership changed before click'
    a.mouse_event(k.MOUSEEVENTF_LEFTDOWN,0,0); down=True
    try: pass
    finally:a.mouse_event(k.MOUSEEVENTF_LEFTUP,0,0); down=False
    event('title_activation_click',screen=[sx,sy]); time.sleep(.2)
def assert_lock():
    owner=dc.current_owner()
    assert lock_token and dc.holds(lock_token) and owner and owner.get('token')==lock_token and owner.get('pid')==os.getpid(),'lock owner/hold mismatch'
    assert time.time()<active_until,'input deadline reached'
    return owner
def point(x,y):
    assert_lock(); sx,sy=g.ClientToScreen(hwnd,(x,y)); assert related(g.GetAncestor(g.WindowFromPoint((sx,sy)),2)),'input point covered by foreign window'
    a.SetCursorPos((sx,sy)); event('mouse_move',screen=[sx,sy],client=[x,y]); time.sleep(.15)
def button(is_down):
    global down
    assert_lock(); assert related(g.GetForegroundWindow()),'foreign foreground before mouse input'
    a.mouse_event(k.MOUSEEVENTF_LEFTDOWN if is_down else k.MOUSEEVENTF_LEFTUP,0,0); down=is_down; event('mouse_down' if is_down else 'mouse_up'); time.sleep(.1)
class CI(C.Structure): _fields_=[('size',W.DWORD),('flags',W.DWORD),('cursor',W.HANDLE),('pos',W.POINT)]
class BIH(C.Structure): _fields_=[('size',W.DWORD),('width',W.LONG),('height',W.LONG),('planes',W.WORD),('bits',W.WORD),('compression',W.DWORD),('image_size',W.DWORD),('xppm',W.LONG),('yppm',W.LONG),('used',W.DWORD),('important',W.DWORD)]
gd=C.windll.gdi32
gd.CreateDIBSection.restype=W.HBITMAP; gd.CreateDIBSection.argtypes=[W.HDC,C.c_void_p,W.UINT,C.POINTER(C.c_void_p),W.HANDLE,W.DWORD]
gd.SelectObject.restype=W.HANDLE; gd.SelectObject.argtypes=[W.HDC,W.HANDLE]
gd.DeleteObject.argtypes=[W.HANDLE]
def draw_image(base,cur,xy):
    dc0=g.GetDC(0); screen=win32ui.CreateDCFromHandle(dc0); mem=screen.CreateCompatibleDC(); w,h=base.size
    header=BIH(C.sizeof(BIH),w,-h,1,32,0,w*h*4,0,0,0,0); bits=C.c_void_p(); bitmap=gd.CreateDIBSection(mem.GetSafeHdc(),C.byref(header),0,C.byref(bits),None,0)
    if not bitmap: raise RuntimeError('CreateDIBSection failed')
    old=gd.SelectObject(mem.GetSafeHdc(),bitmap)
    try:
        C.memmove(bits,base.convert('RGB').tobytes('raw','BGRX'),w*h*4)
        g.DrawIconEx(mem.GetSafeHdc(),xy[0],xy[1],cur,0,0,0,None,3)
        return Image.frombytes('RGB',(w,h),C.string_at(bits,w*h*4),'raw','BGRX')
    finally:
        gd.SelectObject(mem.GetSafeHdc(),old); gd.DeleteObject(bitmap); mem.DeleteDC(); g.ReleaseDC(0,dc0)
def capture(name,kind):
    assert name.startswith('retry2-'),'capture name must preserve first attempt'
    assert_lock(); menu_before=menu_state(); before=g.GetForegroundWindow(); rect=g.GetWindowRect(hwnd); origin=g.ClientToScreen(hwnd,(0,0)); ts=stamp()
    ci=CI(); ci.size=C.sizeof(CI); assert u.GetCursorInfo(C.byref(ci))
    raw=ImageGrab.grab(bbox=rect,all_screens=True); raw.save(R/f'{name}.raw.png')
    after=g.GetForegroundWindow(); sx,sy=ci.pos.x,ci.pos.y
    samples=[]
    for x,y in [(50,15),(280,100),(416,110),(650,300),(400,600),(1250,850)]:
        pt=(rect[0]+x,rect[1]+y); hit=g.GetAncestor(g.WindowFromPoint(pt),2); samples.append(dict(screen=pt,hwnd=hit,related=related(hit)))
    reasons=[]
    menu_after=menu_state()
    if any(s['in_menu'] or s['system_menu'] or s['popup_menu'] for s in [menu_before,menu_after]):reasons.append('menu/popup mode active; not clean editor baseline')
    if not related(before) or not related(after): reasons.append('foreign foreground')
    if before!=hwnd or after!=hwnd:reasons.append('foreground is related secondary window rather than clean dedicated editor')
    if not all(s['related'] for s in samples): reasons.append('foreign window covers sampled target pixels')
    if not(rect[0]<=sx<rect[2] and rect[1]<=sy<rect[3]):reasons.append('cursor outside target')
    info=dict(handle=ci.cursor,visible=bool(ci.flags&1),screen=[sx,sy],client=[sx-origin[0],sy-origin[1]],kind_requested=kind,attributed_to_target=not reasons)
    if ci.cursor:
        isicon,hx,hy,mask,color=g.GetIconInfo(ci.cursor)
        try:
            bi=win32ui.CreateBitmapFromHandle(color or mask).GetInfo(); size=[bi['bmWidth'],bi['bmHeight'] if color else bi['bmHeight']//2]
            for bg,label in [('white','white'),('black','black')]:draw_image(Image.new('RGB',size,bg),ci.cursor,(0,0)).save(R/f'{name}.cursor-{label}.png')
            draw_image(raw,ci.cursor,(sx-rect[0]-hx,sy-rect[1]-hy)).save(R/f'{name}.composite.png')
            info.update(hotspot=[hx,hy],size=size,white=f'{name}.cursor-white.png',black=f'{name}.cursor-black.png',composite=f'{name}.composite.png',composite_method='DrawIconEx directly over raw DIB; synthetic composite, not raw screenshot')
        finally:
            for obj in [mask,color]:
                if obj:g.DeleteObject(obj)
    entry=dict(name=name,time=ts,target_hwnd=hwnd,target_pid=pid,target_title=g.GetWindowText(hwnd),foreground_before=before,foreground_after=after,foreground_title=g.GetWindowText(after),foreground_root_owner=g.GetAncestor(after,3),foreground_pid=p.GetWindowThreadProcessId(after)[1],screen_rect=rect,client_rect=g.GetClientRect(hwnd),client_origin_screen=origin,dpi=u.GetDpiForWindow(hwnd),units='physical pixels',raw=f'{name}.raw.png',raw_cursor_included=False,cursor=info,left_button_down=bool(u.GetAsyncKeyState(1)&0x8000),lock_owner=dc.current_owner(),request_token=request_token,occlusion_samples=samples,input_events_to_capture=len(report['events']),status='rejected' if reasons else 'captured_pending_pixel_review',rejected_reasons=reasons)
    entry['menu_before']=menu_before; entry['menu_after']=menu_after
    if name.startswith('retry2-ribbon'):raw.crop((390,65,442,150)).save(R/f'{name}.button.png'); entry['button_crop_window']=[390,65,442,150]
    report['captures'].append(entry); persist(); event('capture_saved',name=name,status=entry['status'])
    print(json.dumps(dict(capture=str(R/entry['raw']),manifest=str(MANIFEST_PATH),status=entry['status'])),flush=True)
    if reasons:raise RuntimeError('capture rejected: '+','.join(reasons))
try:
    assert not (R/'command.json').exists(),'resident baseline command is pending'
    assert g.IsWindow(hwnd) and p.GetWindowThreadProcessId(hwnd)[1]==pid,'dedicated target changed'
    event('before_request',owner=dc.current_owner(),upper_current=read(UP/'current.json'),upper_progress=read(UP/'progress.json'),upper_run_meta=read(UP/'run_meta.json'),target_hwnd=hwnd,target_pid=pid,target_title=g.GetWindowText(hwnd))
    request_token=dc.request('Web HWP','codex-native-baseline-2026-10-22','one guarded native baseline retry',120)
    if not request_token:raise RuntimeError('request already exists; no retry')
    req=dc.pending_request(); assert req and req['token']==request_token and req['pid']==os.getpid()
    report.update(request_token=request_token,request_created_at=stamp(),request_record=req,request_deadline_epoch=req['requested_at']+120)
    persist(); event('request_created',token=request_token)
    try:lock_token=dc.acquire('Web HWP','codex-native-baseline-2026-10-22','native-baseline-retry',timeout=40,request_token=request_token)
    except Exception:
        # On initialization/publish failure, process exit releases any unreturned OS lock.
        report['acquire_exception']=True; raise
    active_until=min(time.time()+60,report['request_deadline_epoch']-10)
    report.update(lock_token=lock_token,lock_acquired_at=stamp(),input_deadline_epoch=active_until)
    event('lock_acquired',owner=assert_lock(),holds=dc.holds(lock_token),heartbeat_ok=dc.heartbeat(lock_token))
    # No COM or resident commands. Only our pre-existing dedicated window is touched.
    report['ui_input_active']=True; persist()
    assert_lock(); g.SetWindowPos(hwnd,k.HWND_TOP,100,40,1327,966,k.SWP_SHOWWINDOW); time.sleep(.2)
    u.SetForegroundWindow(hwnd); time.sleep(.15)
    if not related(g.GetForegroundWindow()):
        activate_by_title_once()
    assert related(g.GetForegroundWindow()),'dedicated foreground activation failed; no retry'
    normalize_own_system_menu()
    left,top,right,bottom=g.GetWindowRect(hwnd); ox,oy=g.ClientToScreen(hwnd,(0,0))
    point((left+right)//2-ox,top+12-oy); capture('retry2-editor-normal','arrow')
    capture('retry2-ribbon-normal','arrow; pointer away from button; portrait already checked')
    point(416,110); capture('retry2-ribbon-hover','arrow')
    button(True)
    try:capture('retry2-ribbon-pressed','arrow')
    finally:
        if down:
            a.mouse_event(k.MOUSEEVENTF_LEFTUP,0,0); down=False; event('mouse_up_cleanup')
    time.sleep(.2); capture('retry2-ribbon-released','arrow')
    point(500,400); capture('retry2-body-ibeam','I-beam requested; compare actual cursor handle/image')
    report['status']='capture_sequence_completed_pending_pixel_review'
except Exception as e:
    report['status']='failed_no_retry'; report['error']=repr(e); event('attempt_failed',error=repr(e))
finally:
    if down:
        a.mouse_event(k.MOUSEEVENTF_LEFTUP,0,0); down=False; event('final_mouse_up')
    if lock_token and report['ui_input_active']:
        try:
            normalize_own_system_menu(); report['menu_cleanup_verified']=True
        except Exception as e:
            report['menu_cleanup_verified']=False; report['menu_cleanup_error']=repr(e)
    report['ui_input_active']=False; report['input_finished_at']=stamp(); report['mouse_down_remaining']=down
    if lock_token:
        event('before_release',owner=dc.current_owner(),left_button_down=bool(u.GetAsyncKeyState(1)&0x8000),resident_command_pending=(R/'command.json').exists())
        try:
            assert not (R/'command.json').exists(),'resident command appeared; cannot release while pending'
            assert dc.release(lock_token),'release returned False'
            report['lock_released_at']=stamp(); event('release_completed')
            ownreq=dc.pending_request()
            assert ownreq and ownreq.get('token')==request_token and ownreq.get('pid')==os.getpid(),'request identity changed'
            report['request_deleted']=dc.cancel_request(request_token); event('own_request_deleted',ok=report['request_deleted'])
        except Exception as e:report['release_error']=repr(e); event('release_failed',error=repr(e))
    elif request_token:
        # Normal timeout holds no fd. Initialization failure may still hold an unreturned fd: never delete request before process exit.
        if report.get('acquire_exception') and dc._held:
            report['request_retained_for_exit_cleanup']=True
        else:
            report['request_deleted']=dc.cancel_request(request_token); event('no_lock_own_request_deleted',ok=report['request_deleted'])
    if report.get('lock_released_at') and report.get('request_deleted'):
        end=time.monotonic()+30
        while True:
            owner=dc.current_owner(); report['owner_after_return']=owner
            if owner and owner.get('owner')=='Astris':report['astris_return_observed_at']=stamp(); break
            if time.monotonic()>=end:break
            time.sleep(.5)
    report['collector_exit_at']=stamp(); report['collector_exit_record']='synchronous main complete; no outstanding UI/COM tasks; no commands sent to baseline worker'; persist()
    print(json.dumps(report,ensure_ascii=False,indent=2),flush=True)
