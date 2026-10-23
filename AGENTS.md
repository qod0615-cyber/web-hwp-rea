# Web HWP REA 작업 규칙 및 에이전트 연동 가이드

## 같은 Windows PC 공동 제어 규칙 (2026-10-22)
1. Astris 등 다른 작업이 같은 Windows PC를 조작하는 동안 Web HWP의 전경 전환, 마우스 이동·클릭·드래그, 키보드 입력, 클립보드 변경, COM 문서 편집 및 한글 렌더링을 보류한다.
2. 사용자 또는 총괄의 명시적인 제어권 승인과 공통 잠금 획득이 모두 확인되기 전에는 UI 및 한글 자동화를 재개하지 않는다. 시간 경과나 연결 복구를 승인으로 간주하지 않는다.
3. 기존 baseline 상주 프로세스에는 명령을 넣지 않고 idle 상태만 유지한다. 다른 프로세스를 종료하거나 기존 창·문서를 닫거나 수정하지 않는다.
4. 대기 중에는 파일 읽기와 코드 분석만 수행한다. 이 공동 제어 규칙의 AGENTS.md 기록은 사용자 명시 지시에 따른 예외이다.
5. 작업 경계와 공동 잠금은 사용자 및 Astris 총괄이 조정한다. 입력 중단 여부와 재개 조건을 이 터미널에 보고하며 사용자에게 PC 조작을 요구하지 않는다.

### Astris 총괄과 합의한 공용 잠금 계약 (2026-10-22)
1. 공용 모듈은 `C:\Users\K\.orca\coordination\desktop_control.py`이다. Windows Astris 담당이 실제 API, upper_queue 원문 경계 연동 및 fake 동시획득 검증을 구현한다. Web HWP는 별도 잠금 구현이나 실제 `desktop-control.request`를 만들지 않는다. 모듈의 실제 API와 검증 결과를 전달받고 수집기 연결을 다시 지시받기 전까지 입력 중단을 유지한다.
2. `desktop-control.lock`은 영구 파일이며 byte 0에 `msvcrt.LK_NBLCK` OS 잠금을 사용한다. 파일을 교체하거나 삭제하지 않는다. `owner.json`은 `owner/session/job/pid/since/heartbeat/token`을 기록하고 atomic replace로 갱신한다.
3. request는 `O_EXCL`로 생성하며 `owner/session/token/requested_at/reason/max_seconds`를 기록한다. 요청자만 자기 token을 확인한 뒤 삭제한다. stale 5분은 의심 표시일 뿐이며 자동 회수하거나 강제 종료하지 않는다.
4. 실행 순서는 **Astris 현재 원문 완료 및 해제 확인 → Web HWP OS 잠금 획득 → UI 작업 전 구간 잠금 유지 및 30초마다 heartbeat → 실제 UI/COM 입력 종료 확인 → 잠금 해제 → 자기 request 삭제**이다. 시간 경과나 요청 파일의 존재를 제어권 승인 또는 잠금 획득으로 간주하지 않는다.
5. 파일 읽기와 코드 분석은 병행할 수 있다. 보이지 않는 COM 문서 편집과 한글 렌더링도 동일한 UI 잠금이 필요하다. 현재 baseline 상주 프로세스는 명령 없는 idle 상태로 유지하며, 추가 UI·COM 입력 없이 대기한다.

## 원격 Windows Codex 운영 책임 (2026-10-22)
1. 사용자는 원격 Windows PC의 Codex 창을 보지 않는다. 사용자에게 PC 창 확인, 프롬프트 입력, 결과 복사를 요구하지 않는다.
2. Linux 주 에이전트가 Windows 작업 지시, 진행 상태 확인, 오류 해결, 캡처와 결과 회수 및 검증을 담당한다.
3. 입력 수락, 작업 시작, 작업 완료, 산출물 검증을 구분한다. 실제 산출물을 확인하기 전에는 성공을 주장하지 않는다.
4. 연결 지연만으로 작업을 중복 실행하지 않으며, 사용자에게 PC 조작을 떠넘기지 않는다.
5. 결과 절대 경로, 재현 절차와 실패 원인을 Windows 작업 터미널에 보고한다. 첫 캡처와 manifest가 준비되면 후속 작업 중에도 즉시 절대 경로를 출력한다.

## 1. ADHD 출력 규칙 (필수 준수)
1. 답변/다음 액션 우선: 명령어, 경로, 코드 스니펫 먼저 제시.
2. 여러 단계는 번호 부여, 단계당 1개 액션.
3. 2분 이내 완료 가능한 다음 액션 1개로 마무리.
4. 현재 이슈 해결 전 새 이슈 제기 금지.
5. 진행 상황 표시 ("5단계 중 3단계 완료").
6. 구체적 시간 단위 제시 ("약간" 금지).
7. 변경 후 무엇이 동작하는지 제시.
8. 에러: 위치, 원인, 해결책 순서.
9. 목록 최대 5개.
10. 서론/인사말/요약 생략.

---

## 2. Windows PC 페어링 연동 규칙 (Claude / Codex / Antigravity 공통)

이 프로젝트([`/home/k/projects/Web HWP REA`](file:///home/k/projects/Web%20HWP%20REA))는 로컬 Windows PC의 `Web HWP REA` 프로젝트 세션과 항상 연동하여 작업합니다.

### 연동 대상 정보
- **Orca 환경명**: `home window-pc` (`ws://100.105.111.56:6768`)
- **Windows 작업 경로**: `C:\Users\K\Desktop\Claude\Web HWP REA`
- **Windows 한글 REA 원본 경로**: `C:\Users\K\Desktop\Claude\한글 REA`
- **Windows 분석 도구/바이너리**: `C:\Users\K\tools\proj` (HwpApp.dll, hwpeq5X.ocx, HncBaseDraw.dll 등)

### 연동 명령어 (스크립트 지원)
프로젝트 내 [`scripts/win_term.sh`](file:///home/k/projects/Web%20HWP%20REA/scripts/win_term.sh)를 통해 Windows 세션과 입출력을 주고받습니다.

```bash
# 1. Windows 세션 최근 출력 확인 (기본 40줄, 줄수 지정 가능)
./scripts/win_term.sh read 30

# 2. Windows 세션으로 메시지/명령 전달
./scripts/win_term.sh send "진행할 프롬프트 또는 응답 내용"

# 3. Windows 세션 핸들 ID 직접 확인
./scripts/win_term.sh handle
```

### CLI 직접 제어 (원문)
```bash
# 터미널 목록 조회
orca terminal list --environment "home window-pc" --json

# 터미널 읽기
orca terminal read --environment "home window-pc" --terminal <handle> --limit 50 --json

# 터미널 입력 전송
orca terminal send --environment "home window-pc" --terminal <handle> --text "<텍스트>" --enter --json
```

---

## 3. 핵심 개발 목표
- PC 한글(HWP) 수식 편집기 및 렌더링 동작을 웹(Canvas/SVG/TypeScript) 환경에 오차 없이 동일하게 구현.
- Windows 환경의 `한글 REA`에서 추출된 수식 메트릭, 토큰 파서, 간격 규칙을 연동하여 웹 렌더러/입력기 코어 개발.

---

## 4. 무한 자율 반복 필수 규칙 (확인 질문 절대 금지)
1. **질문으로 멈춤 절대 금지**: "진행할까요?", "~를 실행할까요?", "확인해 주세요"와 같이 사용자에게 확인을 묻고 대기하는 행위를 엄격히 금지함.
2. **오차 0px 수렴 시까지 무한 자율 실행**: 단계가 끝나면 즉시 다음 잔여 오차 분석, 코드 보정, 대조 검증 루프를 멈춤 없이 100% 전자동으로 연속 실행할 것.
3. **배포 절대 금지**: 모든 작업은 로컬 테스트 및 자동 대조 스크립트로만 자율 검증할 것.
