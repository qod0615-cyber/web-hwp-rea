#!/usr/bin/env bash
# Web HWP REA - Windows PC 연동 도구
set -e

ENV_NAME="${ORCA_ENV:-Laptop PC}"
PROJECT_KEY="Web HWP REA"

get_handle() {
  python3 -c "
import subprocess, json, sys
try:
    out = subprocess.check_output(['orca', 'terminal', 'list', '--environment', '$ENV_NAME', '--json'])
    data = json.loads(out)
    terminals = data.get('result', {}).get('terminals', [])
    # 1. Connected & writable Codex terminal in project worktree
    for t in terminals:
        if '$PROJECT_KEY' in t.get('worktreePath', '') and t.get('connected') and t.get('writable') and t.get('agentIdentity') == 'codex':
            print(t['handle'])
            sys.exit(0)
    # 2. Any connected & writable terminal in project worktree
    for t in terminals:
        if '$PROJECT_KEY' in t.get('worktreePath', '') and t.get('connected') and t.get('writable'):
            print(t['handle'])
            sys.exit(0)
    # 3. Fallback to any matching project worktree
    for t in terminals:
        if '$PROJECT_KEY' in t.get('worktreePath', ''):
            print(t['handle'])
            sys.exit(0)
    print('', end='')
except Exception as e:
    print(f'ERROR: {e}', file=sys.stderr)
    sys.exit(1)
"
}

cmd="${1:-read}"

case "$cmd" in
  handle)
    get_handle
    ;;
  read)
    HANDLE=$(get_handle)
    if [ -z "$HANDLE" ]; then
      echo "Error: Windows PC에서 $PROJECT_KEY 터미널을 찾을 수 없습니다." >&2
      exit 1
    fi
    LIMIT="${2:-40}"
    orca terminal read --environment "$ENV_NAME" --terminal "$HANDLE" --limit "$LIMIT" --json | python3 -c "
import json, sys
data = json.load(sys.stdin)
tail = data.get('result', {}).get('terminal', {}).get('tail', [])
for line in tail:
    print(line)
"
    ;;
  send)
    HANDLE=$(get_handle)
    if [ -z "$HANDLE" ]; then
      echo "Error: Windows PC에서 $PROJECT_KEY 터미널을 찾을 수 없습니다." >&2
      exit 1
    fi
    shift
    TEXT="$*"
    if [ -z "$TEXT" ]; then
      echo "Usage: $0 send <message>" >&2
      exit 1
    fi
    orca terminal send --environment "$ENV_NAME" --terminal "$HANDLE" --text "$TEXT" --enter --json
    ;;
  status|list)
    orca terminal list --environment "$ENV_NAME" --include-visual-layouts --json
    ;;
  *)
    echo "Usage: $0 {read [limit]|send <text>|status|handle}" >&2
    exit 1
    ;;
esac
