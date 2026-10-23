# Windows PC 공동 제어 — Astris / Web HWP

2026-10-22 사용자 지시 및 Astris 총괄과 합의. 사용자에게 PC 화면 확인·수동 중재를 요구하지 않는다. 실행 기준은 AGENTS.md 6절이다.

## 현재 상태

최신 사용자 지시: **당분간 Astris는 Windows 작업을 하지 않고 Web HWP가 사용한다.** 직전 로그에는 Astris가 재개된 상태였으므로, Astris 총괄에 현재 원문 완료 후 안전 중지·잠금 반환과 후속 Windows 작업 중단을 요청했다. 실제 반환 확인 전에는 새 Web HWP UI 작업을 시작하지 않는다. 아래의 upper-0051 완료까지 실행 안내는 이전 합의이며 최신 지시가 우선한다.

- 제어권: Astris. 담당은 `home window-pc`의 `term_8af35f1c-d9b8-4c26-8500-fedc378ff271`, 폴더 `C:\Users\K\Desktop\Claude\한글 REA`.
- Astris 총괄: Linux `term_4fb45d96-6e63-4560-805f-1fd217e5d097`.
- Web HWP 담당: Windows Codex `term_e82f66b7-ab59-4712-8595-446cbf0a4c1a`. UI/클립보드/COM 작업 중단 및 baseline 명령 파일 부재를 해당 세션이 보고했다.
- Astris upper_queue는 원문마다 약 14초간 포커스·키보드·마우스·클립보드를 사용한다. Hwp 자동 재시작도 동일한 공유 자원을 사용한다. 창이 가만히 있어도 제어권이 비었다고 판단하지 않는다. 최신 사용자 지시를 전달받은 Astris 총괄에 따르면 현재 `upper-0051`까지만 실행하고 잠금 해제·큐 종료하며, 다음 주까지 새 작업을 시작하지 않는다. 이전의 upper-0052 연속 실행 안내는 폐기한다.
- Astris 총괄이 구현 및 fake 검증 완료를 보고했다. upper-0051은 원문 경계 1053에서 정상 정지 후 16:58:32 재기동했고 1056부터 계속했다. 보고된 capture_stdout.log는 16:58:32 acquired(pid 21888), 16:59:47 LockTest request 경계 해제, 16:59:51 재획득, 16:59:59 resumed다. 이는 Astris 측 보고이며 Web HWP는 별도로 캡처 인계 결과를 검증한다.

## 현재 시도와 모듈 검토

Astris 총괄이 Web HWP의 120초 request 1회 사용을 승인했다. Windows Codex에 동일 모듈 import, 요청 후 acquire(timeout=40, request_token=자기 token), 실제 UI 작업 60초 이내, 입력·COM 명령 잔류 없음 확인, release 완료 후 자기 request 삭제, Astris 재획득 최대 30초 관찰을 지시했다. 아직 실제 인계·촬영 결과를 회수하지 않았으므로 성공으로 기록하지 않는다.

첫 인계의 실제 결과를 회수했다. Web HWP는 17:06:51 요청, 17:07:03 잠금 획득, 17:07:05 해제 및 자기 request 삭제를 기록했고 Astris PID 21888 재획득을 관찰했다. Astris 총괄도 17:07:02 경계 해제, 17:07:05 재획득, 17:07:15 편집기 재오픈·재개를 별도 로그로 확인했다. **인계·반환은 검증됐지만 기준 캡처는 실패했다.** `event()`의 name 인자 충돌로 첫 이미지 뒤 중단됐으며, 직접 연 이미지에는 제목 표시줄 좌상단 아이콘 클릭으로 시스템 메뉴가 남아 있었다. Windows Codex에 함수 인자명과 활성화 클릭 위치·메뉴 상태 검사를 수정하고 retry2 산출물로 구분하도록 지시했다. 수정은 파일 작업만 허용하고 실제 재촬영은 최신 사용자 지시에 따른 Astris 제어권 반환 확인 후 재개한다.

Web HWP는 공유 모듈을 중복 수정하지 않고 원문 사본과 정적 검토 JSON을 회수했다. 확인한 초기 소스 SHA-256은 `73e71d6b157b2f3c0aa9a5e45a20fee50bd2e5e81f9ffc98f86137414d6b3435`다. 공용 API는 acquire(owner, session, job, timeout=None, request_token=None, poll=0.5), release(token), heartbeat(token), holds(token), current_owner(), pending_request(), request(owner, session, reason, max_seconds), cancel_request(token), wait_request_gone(...)다.

release의 owner 게시 순서, acquire 초기화 실패 rollback, 만료 request 우회, 불완전 request 읽기 등 4건을 소스로 확인해 Astris 총괄에게 전달했다. Astris 담당이 원문 경계에서 수정하기로 회신했다. 이번 짧은 인계는 request를 release 완료까지 유지하고 시간 만료 우회 없이 진행하며, acquire 초기화 실패 시 UI를 시작하지 않는다. 모듈 수정 완료와 실행 중 큐 반영 여부는 후속 확인한다.

## 공용 인터페이스 합의

| 항목 | 경로 / 규칙 |
| --- | --- |
| 공용 구현 | `C:\Users\K\.orca\coordination\desktop_control.py` — 양쪽이 동일 파일 사용 |
| OS 잠금 | 같은 폴더 `desktop-control.lock` — 영구 파일, msvcrt.LK_NBLCK byte 0; 삭제·교체 금지 |
| 소유 정보 | `desktop-control.owner.json` — owner/session/job/pid/since/heartbeat/token, atomic replace, 30초 heartbeat |
| 요청 | `desktop-control.request` — O_EXCL 생성, owner/session/token/requested_at/reason/max_seconds, 요청자만 자기 token 확인 후 삭제 |
| 장애 처리 | 5분 stale은 의심 표시. 실제 프로세스·작업 종료 확인 없이 강제 회수·삭제·종료하지 않음 |

## 인계 순서

1. 양쪽 적용과 fake 검증을 확인한 뒤 Web HWP가 요청을 생성한다.
2. Astris는 현재 원문을 마치고 잠금을 반환한다. request가 남아 있으면 다음 원문 및 Hwp 재시작 UI를 진행하지 않는다.
3. Web HWP가 같은 OS 잠금을 획득하고 전용 작업 전 구간 동안 잠금과 heartbeat를 유지한다.
4. 원격 UI/COM 명령 종료를 확인한 뒤 잠금을 반환하고 자기 request를 삭제한다.
5. Astris가 재획득하여 다음 원문으로 이어간다. 두 총괄이 실제 결과를 회수한다.

실행 중 큐가 디스크의 수정본을 실제로 읽는지 확인해야 하며, 코드 수정만으로 기존 프로세스에 반영됐다고 간주하지 않는다. 코드 버전 변경 후에는 기존 모듈 객체를 재사용하는 상주 프로세스와 새 import를 구분한다.
