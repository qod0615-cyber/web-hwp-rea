## 2026-10-23 재개 — Laptop PC 환경 동기화 및 웹 생성 HWPX 한글 2022 COM 열기 검증 완료 (4/4)

사용자 「재개」 지시에 따라 Laptop PC 환경과 최신 작업물을 동기화하고, 웹에서 생성·편집한 HWPX 문서를 실제 Windows 한글 2022 COM 인스턴스에서 열어 정합성을 검증했다.

1. **Laptop PC 워크트리 동기화 및 빌드 검증**:
   - Mini PC 최신 작업물(HWPX 양방향 왕복, 5개 리본 탭 분리, UIA hit 영역, 검증 스위트)을 `master`(`fc2454b`)로 푸시 및 Laptop PC에 pull/clean 동기화 완료.
   - Windows 환경 파일 입출력(`cp949`) 호환을 위해 테스트 스크립트 전반에 `utf-8` 인코딩 명시.
   - Laptop PC `npm run build` 통과 (단일 번들 `dist/index.html` 746KB 정상 생성).

2. **Laptop PC 로컬 검증 스위트 47/47 통과**:
   - `scripts/test_editor_workflows.py`: 11/11 통과 (수식 삽입/편집/복구, 대화상자, 리본 전환)
   - `scripts/test_ribbon_tabs.py`: 5/5 통과 (5개 리본 픽셀 영역 0px 차이, 91개 컨트롤 rect, 드롭다운 팝업)
   - `scripts/test_first_screen_controls.py`: 4/4 통과 (UIA 버튼 54개 hit 영역 및 인쇄 hover 범위)
   - `scripts/check_native_equation_metrics.py`: 24/24 통과 (수식 너비/높이/기준선 일치)
   - `scripts/test_hwpx_workflows.py`: 7/7 통과 (HWPX ZIP/XML 파싱, 표 메트릭 보존, 314개 수식 보존)

3. **웹 생성 HWPX 실제 한글 2022 COM 열기 검증 통과 (4/4)**:
   - Laptop PC의 `HWPFrame.HwpObject` COM 인스턴스(`v12.0.0.535`) 및 `FilePathCheckerModule` 바이패스를 통해 웹 산출물 직접 열기 실행 (`scripts/test_native_hwpx_open.py`).
   - `live-saved.hwpx`: 성공 (본문 텍스트 및 수식 `{a+b} over {c}` 1개 복원)
   - `new-rich-equation-table.hwpx`: 성공 (굵게/색상/줄바꿈/탭/4칸 표 및 수식 정상 인식)
   - `after-reload.hwpx`: 성공 (브라우저 새로고침 후 재저장본 정상 인식)
   - `native-314-edited.hwpx`: 성공 (웹에서 텍스트 수정한 314개 수식 문서가 한글 2022에서 314개 수식 컨트롤 `eqed` 전부 온전히 복원)
   - 검증 영수증: `verification/hwpx-roundtrip/native-open-report.json`

---

## 2026-10-23 Desktop PC 작업물 Mini PC 이전·종료 및 Laptop PC 환경 세팅 완료

사용자 지시에 따라 Desktop PC 작업을 안전하게 마무리하고 미니 PC로 이전·종료한 뒤, 노트북(`Laptop PC`) 환경 구축 및 위임 준비를 완료했다.

1. **기기 명칭 변경 및 Orca 환경 정리**:
   - 데스크톱: `home window-pc` → `Desktop PC` (`ws://100.105.111.56:6768`)
   - 노트북: `laptop pc` → `Laptop PC` (`ws://100.127.163.21:64054`)
   - 설정 파일 `~/.config/orca/orca-environments.json` 및 `scripts/win_term.sh`(`ORCA_ENV` 지원) 갱신 완료.

2. **Desktop PC 작업물 이전 및 안전 종료 완료**:
   - 12:15 KST 지시 전달 → Desktop PC Codex 세션이 작업 정리 및 미니 PC 백업 수행.
   - Git 인계 브랜치: `handoff/desktop-20261023` (커밋 `7276d01`) GitHub push 완료.
   - 미니 PC 산출물 백업: `/home/k/desktop-handoff/web-hwp-rea/2026-10-23/` (799개 파일 55.6MB, 파일/패키지 SHA256 100% 일치 확인, `MINIPC_VERIFIED_RECEIPT.json`).
   - 데스크톱 OS 잠금 해제 확인 (`owner: null`, request 부재, `OS_byte_lock_confirmed_free_and_diagnostic_lock_released: true`).
   - Desktop PC 12:18:50 종료 예약 후 오프라인 전원 꺼짐 확인 (`SHUTDOWN_RECEIPT.json`).

3. **Laptop PC (`C:\Users\qod06\Desktop\Claude\Web HWP REA`) 개발 환경 구축**:
   - 저장소 클론 및 Orca 워크트리 등록 완료 (`master C:/Users/qod06/Desktop/Claude/Web HWP REA`).
   - Git 최신 인계 브랜치(`handoff/desktop-20261023`) 체크아웃 완료.
   - `npm install` (353개 패키지) 및 `npm run build` (851ms 통과, dist 싱글파일 생성 확인).
   - 활성 작업 터미널: `term_d3004218-7b3a-45aa-abbb-9788760df2a9`.

4. **Laptop PC 한글 2022 및 보안 Bypass 확인**:
   - 한글 2022 실행 파일: `C:\Program Files (x86)\HNC\Office 2022\HOffice120\Bin\Hwp.exe`
   - COM 클래스: `HWPFrame.HwpObject` 정상 생성 및 제어 확인.
   - 보안 모듈 Bypass: `HKCU\Software\Hnc\HwpAutomation\Modules` 및 `HKCU\Software\HNC\HwpAutomation\Modules`에 `FilePathCheckerModule`(`C:\Users\qod06\AppData\Local\Programs\Python\Python312\Lib\site-packages\pyhwpx\FilePathCheckerModule.dll`) 및 `AstrisPathChecker` 기등록 확인. 보안 팝업 없이 100% bypass 동작 가능.
   - 원격 시스템 제어: 120초 예약 후 취소(`shutdown /a`) 및 10초 실제 시스템 종료/재부팅 복구 검증 완료.
   - 화면 및 창: 주 모니터 `1920×1080` (Primary), 보조 모니터 `1536×864`. Chrome 및 한글 2022 창 기동 확인 완료.

5. **다음 작업 (13:00 위임 재개)**:
   - 노트북(`Laptop PC`)에서 Codex 세션을 기동하여 HWPX 저장/열기 웹 구현 및 native 대조 작업 착수 대기.

---

## 2026-10-23 사용자 승인 배포 1회 완료·공개 검증

사용자 「배포 1회」에 따라 현재 수정본을 기존 프로젝트 web-hwp-rea (`prj_9meN3B3UC6V59cbgfvlpgcmb3QK8`)에 production 배포 1회 실행했다. **이번 승인 1회 소진. 추가 배포 승인 잔여 0회.** 기존 배포 예외와는 별개인 새 사용자 승인이다.

공개 주소: https://web-hwp-rea.vercel.app/ . 배포 ID `dpl_8V9BaYh16UJRBUcZCyFcvtmYrjsP`, immutable URL `https://web-hwp-6bvc0hbdv-qod0615-2108s-projects.vercel.app`, readyState=READY, target=production 및 기존 공개 주소 alias 연결을 CLI 영수증에서 확인했다. build `3137294a888afd5e`로 로컬/공개 HTML meta/release.json/sw.js 모두 일치한다. 배포 전 dry-run에서 Vite 프레임워크, 248개 입력, verification/docs/.orca 및 원본 작업 증거 제외를 검증했다. npm run build 성공 후 vercel deploy --prod --yes --format=json을 정확히 1회 호출했다. 재시도·2차 배포 없음.

공개 주소의 별도 Chromium 컨텍스트에서 HTTP200, 브라우저 오류0, 다섯 새 리본 버튼 수(24/22/10/16/19), 보안 화살표 메뉴 열기/닫기, 100% 배율을 확인했다. 텍스트와 분수 수식을 입력해 HWPX 파일을 실제 다운로드했고 Python ZIP/XML에서 mimetype 첫 항목 무압축·본문·수식 스크립트를 검증했다. 다운로드 문서를 공개 앱에서 다시 열어 본문/수식 복원도 확인했다. 이는 PC 한글 재열기 검증이 아니다.

release.json/sw.js의 Cache-Control=no-store, 실제 service worker 제어, 브라우저 오프라인 전환→재시작→동일 build와 본문/수식 복원 및 쪽 리본 표시를 확인했다. live-first-screen.png와 live-offline-page-tab.png를 직접 열어 배포 화면을 확인했다. 사용자 Windows 설치형 앱을 직접 조작·관찰한 것은 아니다. Windows GUI/COM/request/원격 세션 조작 없음.

결과/승인 소진/배포 영수증/검증 HWPX/이미지: `verification/release-2026-10-23/`. 실행 가능한 공개 검증 스크립트: `scripts/verify_live_release.py` (배포 동작 없음). 원본과 UI·모든 기능 동일 완료를 주장하지 않으며 직전 리본 기록의 67개 미지원과 전체 상태·문서 배치 검증은 남아 있다.

---

## 2026-10-23 탭별 리본 분리 — 추가 5개 탭 및 3개 메뉴

사용자 「ㅇㅇ 확인」 이후 앞서 약속한 “다른 탭에 편집 리본이 남는 문제”를 수정했다. 보기/쪽/보안/검토/도구가 각 native 리본·선택 메뉴 이미지를 사용한다. 편집 버튼 hit 영역은 이제 편집 탭에서만 생성된다. 기존 `ui-reference-manifest.json`에서 review_status=verified_visual_reference인 캡처를 직접 열어 확인하고 `scripts/prepare_ribbon_references.py`로 정해진 crop과 SHA256을 기록해 파생 자산을 만든다. native client−(1,1) 기준에 맞춰 ribbon crop=(1,67,1326,151), 선택 메뉴 앞 600px crop=(1,33,601,67)이다. `src/components/ribbon-reference.json`이 캡처/해시/버튼 rect/자산을 연결한다.

보안/검토/도구 메뉴 화살표를 연결했다. 원본 드롭다운 캡처의 이미지와 실제 항목 rect를 사용하며 해당 화살표를 눌러도 활성 리본은 바뀌지 않는다. `ReferenceDropdown.tsx`에서 메뉴 열기, 방향키/Home/End 이동, Escape/Tab/바깥 클릭 닫기, 초점 반환을 처리한다. 이 세 메뉴의 항목 기능 및 하위 메뉴는 미지원이며 성공 메시지 대신 명확한 미지원 알림을 표시한다. 원본 비활성 항목은 disabled다.

추가 91개 리본 control 중 실제 동작 13개(보기 10개: 컬러/회색조/그림 표시/상황 선/문서 탭/축소/확대/100%/쪽 맞춤/폭 맞춤, 쪽 3개: 편집 용지/세로/가로)를 연결했다. 보기 토글은 문서를 삭제하거나 바꾸지 않고 표시만 바꾼다. 문서 탭 wrapper의 높이가 0이던 것도 수정했다. 나머지 native enabled 67개는 미지원이며 이를 기능 통과로 세지 않는다. 원본에서도 비활성인 것은 11개다. 특히 쪽의 `단`/`쪽 여백`은 native MenuItem인 만큼, 임의의 단 수 순환이나 다른 대화상자로 대신 연결하지 않는다. 미지원 목록은 결과 JSON에 전부 보존한다.

검증: `test_ribbon_tabs.py` 5/5. 다섯 리본의 1253×84 영역, 다섯 선택 메뉴의 600×34 영역, 세 드롭다운 이미지가 저장된 원본 캡처와 다른 픽셀 0이다. 추가 버튼 91개는 1916px 창에서 원본 UIA rect/중앙/양쪽 모서리 elementFromPoint/비활성 상태를 확인했다. 실제 배율/회색조/그림·문서탭·상황선 숨김/복원, 용지 설정/방향 전환, 메뉴 키보드·닫기를 별도로 검사했다. 보기·쪽 결과 이미지와 세 원본 드롭다운 파생 이미지를 직접 열어 확인했다.

동일 작업에서 기존 첫 화면 4/4, 편집 11/11, HWPX 7/7, PWA 1/1 및 빌드 통과. 최종 `단`/`쪽 여백`의 부정확한 대체 동작 연결을 제거한 후 리본 검사 5/5를 다시 통과했다. 결과/해시: `verification/ribbon-tabs/verification-summary.json`. 이 기록은 초기 캡처 상태·정해진 비교 영역에 한하며 모든 버튼 기능/hover·pressed·checked/초점 표시/native 창 움직임/전체 화면 동일 완료가 아니다.

새 배포/원격 Windows 명령/GUI/COM/request 없음. 남은 것은 67개 새 리본 미지원 기능·세 메뉴 명령/하위 메뉴, 기존 편집 리본의 toast-only 동작, 입력/서식 리본 전체 버튼, 제목줄·눈금자·상태줄, 동적 활성/선택 및 모든 상태의 native 대조다.

---

## 2026-10-23 첫 화면 버튼/음영 지적 — 추정 클릭 영역 제거

사용자가 첫 화면 여러 버튼 무반응과 인쇄 버튼 음영 어긋남을 두 장의 이미지로 지적했다. 기존 코드는 이미지의 아이콘 범위 사이 중간점을 버튼 경계로 간주했다. 원본 UIA 기록 `verification/native-baseline/2026-10-22/ui-reference-manifest.json`에는 실제 버튼 rect가 이미 있었다. 인쇄는 기존 웹 x149/y155/33×27에서 원본 client−(1,1)인 x158/y156/24×24로 고쳤다. 편집 리본 22개, 빠른 서식 23개, 메뉴 9개 총 54개를 UIA 좌표로 연결했다. 데이터·해시는 `src/components/native-control-bounds.json`, 공통 좌표 적용은 `App.tsx`의 controlStyle이다. 기본 hover border-radius 추정 2px도 제거했다. native 색·모든 음영 동일 판정은 아니다.

빠진 빠른 서식 취소선/정렬 6개/줄 간격과 편집 리본 글자 바꾸기 버튼을 연결했다. 줄 간격은 선택 문단에 적용하며 Enter 기본 동작을 차단해 선택 본문이 삭제되는 문제를 수정했다. 글자 크기는 브라우저의 1..7 preset을 한글 pt로 잘못 표시하던 방식 대신 실제 선택 pt를 적용한다. ToolbarCombo는 실제 선택 글꼴·크기를 표시한다. 다만 커서 위치에 따른 전체 toolbar 값 동기화와 native 정렬 조판 일치는 미완료다. 정렬(개체)은 빈문서 native처럼 disabled로 둔다. 리본/빠른 서식 버튼은 실제 button 요소로 변경했다.

빠른 조작에서 selectionchange의 늦은 저장으로 수식이 문서 끝에 삽입되는 경우를 회귀 검사에서 재현했다. 키 처리와 pointerdown capture 직전에 본문 Range를 동기 저장한다. 문서 초기 복원도 useLayoutEffect로 수행해 첫 입력 이후 초기화가 개입하지 않게 했다.

`test_first_screen_controls.py`: 별도 원본 manifest에서 기대 rect를 읽어 4개 창 크기(960/1204/1916/2560)에서 버튼 좌상/중앙/우하 점의 실제 elementFromPoint를 검사한다. 1916px에서는 54개 rect 모두 일치한다. 인쇄 hover의 전체 diff bbox가 정확히 24×24 rect 안에 한정되고 좌표 클릭이 window.print를 호출한다. 취소선·정렬·24pt·200% 줄 간격·궁서 적용 및 글자/문단/용지/바꾸기 창 열기를 좌표로 확인했다. 인쇄 crop과 본문 적용 화면을 직접 열어 확인했다. 이는 전 버튼 실제 기능 검증이나 전체 native pixel 비교가 아니다.

검증: 첫 화면 4/4, 편집 11/11, HWPX 7/7, PWA 1/1 및 빌드 통과. 결과와 구체적인 미완료 목록은 `verification/first-screen-controls/verification-summary.json`에 기록했다. 이번 변경은 로컬이며 배포하지 않았다. Windows GUI/COM/request/원격 명령 없음.

**아직 사용자 요구 전체를 완료하지 않았다.** 바탕쪽·개체 선택/보호는 toast-only, 조판 부호 지우기 native 행동 미완료. 보기/쪽/보안/검토/도구 리본이 편집 fallback이고 보안/검토/도구 화살표 dropdown이 연결되지 않았다. 제목줄/검색/리본 접기/눈금자 드래그/상태줄 보기 버튼, split menu, 선택·비활성·눌림 상태, native hover palette 및 창 움직임도 미완료다. 54개 좌표 통과를 첫 화면 전체 동작 완료로 표현하지 않는다.

---

## 2026-10-23 resume — 실제 HWPX 왕복 검증 및 표 메트릭 보존

복구 당시 App.tsx에는 이미 HwpxDocument(`src/document/hwpx-document.tsx`)와 DocumentFileSession이 연결돼 있었다. 아래의 “plaintext 저장/readAsText”는 이전 상태다. ZIP/XML 저장·열기, 파일 연결 저장/다른 이름 저장, 취소/쓰기 실패 처리, 새로고침 원본 복원이 현재 구현돼 있다. 미커밋 변경은 보존했다.

첫 HWPX 브라우저 검사에서 6개 중 4개 통과, 2개 실패를 확인했다. 검사 스크립트의 저장 picker mock에 닫는 괄호가 빠져 JavaScript 구문 오류가 났고, 편집기 포커스 없이 보낸 최초 Ctrl+O는 filechooser 대기 시간 초과였다. mock을 여러 줄의 올바른 함수로 수정하고 초기 편집기를 클릭한 뒤 키를 입력하도록 수정했다.

`hwpx-document.tsx`의 표 저장은 본문만 수정해도 원본 셀 너비/높이/여백을 고정값으로 덮어썼다. 원본 셀 identity를 보존하고 기존 cellSz/cellMargin 값을 유지하도록 수정했다. rowspan으로 점유된 열을 건너뛰어 cellAddr/colCnt를 계산한다. 합성 병합 표에 서로 다른 크기·여백을 넣고 열기→본문 수정→저장 후 독립 Python ZIP/XML 검사에서 cellAddr/cellSpan/cellSz/cellMargin 보존을 검증했다. 이 표본은 실제 한글에서 저장한 표본이 아니며 native 재열기 완료를 뜻하지 않는다.

최종 검증: npm run build 성공, HWPX 7/7, 편집 11/11, PWA 업그레이드/오프라인 재시작 1/1, 기본 native 수식 메트릭 24/24 통과. 원본 job0058 314개 수식은 텍스트 수정과 새로고침 후 저장한 문서에서 각 equation XML 전부 동일하다. 여러 구역/불투명 개체/첨부파일 보존, 굵게·색·18pt·장식·탭·줄바꿈·수식·표의 브라우저 왕복도 검사했다. rich-document.png를 직접 열어 본문·표·수식 표시를 확인했다. 결과/산출물 SHA256: `verification/hwpx-roundtrip/browser-workflows/verification-summary.json`.

Windows 기존 term_63105ff9-2455-4b16-a4a0-62e745ccf27a 화면은 이전 자료 수집 완료 후 입력 대기다. 새 원격 명령/GUI/COM/request 생성/배포 없음. 공용 잠금의 현재 적용 및 fake 검증 증거를 확인하기 전 실제 한글 재열기를 시작하지 않는다. 남은 검증은 웹 생성 HWPX의 실제 한글 열기·재저장·문서 배치 대조다. 현재 브라우저 왕복 통과를 native 호환성/0px 일치 또는 배포 적합성으로 확대하지 않는다.

---

## 2026-10-23 세션 복구 — HWPX 구현 준비 지점 회수

사용자 「세션 복구」에 따라 미커밋 변경을 보존하고 기존 Windows Codex `term_63105ff9-2455-4b16-a4a0-62e745ccf27a`의 실제 화면 출력을 읽었다. 연결·쓰기 가능, 마지막 자료 수집 완료 보고 후 입력 대기 화면을 확인했다. 새 세션/중복 작업/GUI/COM/request/배포 실행 없음.

인계 문서보다 최신인 HWPX 자료 수집 결과를 회수했다. `verification/hwpx-roundtrip/2026-10-23/hwpx-document-fixtures.zip` SHA256 `9032136d43c55b1932468b91003a02badc2835a46fa2f73c7b3191d0ec43d628` 일치. manifest·coordination-state·원본 HWPX를 같은 폴더에 추출했다. 내부 job0058 HWPX SHA256 `9a4596bd5d8e30a7a55e03790cb8dd2e86684332eb9465e397f048c692b3c30b`도 기존 원본과 일치한다. 225개 파일 조사에서 표·다중 구역·빈문서·실제 적용된 굵게/색/복수 크기 표본은 찾지 못했다. 원본 수식 314개 문서 1개만 확보한 것으로, 4종 신규 생성/재열기 완료가 아니다.

복구 시 `npm run build`, `python3 scripts/test_editor_workflows.py` 11/11, 기본 native 수식 검사 24/24 통과. 전체 corpus 3,830/4,158은 이전 검증 기록이며 이번 복구에서 전체 재실행하지 않았다.

현재 구현 준비 파일: `src/document/hwpx-archive.ts`, `file-session.ts`, `hwpx-reader.ts`, `templates/default.json`, `templates/provenance.json`. `App.tsx` handleSave/handleOpen은 여전히 plaintext 저장/readAsText이며 새 모듈 연결과 실제 HWPX 저장 왕복이 다음 작업이다. 템플릿은 native job0043을 가공한 빈 패키지로 신규 native 빈문서가 아니다. PC 제어는 공용 잠금 현재 적용·fake 동시획득 증거 확인 전 재개하지 않는다. 기존 배포 보류 유지.

---

## 2026-10-23 배포 적합성 판단 — 이번 배포 보류

사용자 「지금 배포할만한가?」「할만하면 하고, 아니면 하지마」에 따라 판단했다. 현재 빌드/편집 11개/PWA 갱신 검사는 통과했고 수식 엔진 개선이 있지만, `src/App.tsx`의 handleSave가 여전히 innerText를 text/plain Blob으로 저장하고 .hwpx 확장자를 붙이며 handleOpen도 바이너리 HWPX를 readAsText로 읽는다. 수식/표/서식을 보존하는 실제 문서 저장이 아니므로 이번에는 실사용 배포를 보류했다. 배포 실행 없음. 조건부 사용자 지시를 향후 임의의 배포 횟수 승인으로 적립하지 않는다. 다음 배포 판단에서 실제 HWPX 저장/열기 왕복과 수식/서식 보존을 우선 검증한다.

---

## 2026-10-23 추가 진행 — 원본 job0058 314/314 메트릭 일치

사용자의 「알아서 진행중인거지?」에 이전 최종 응답 뒤에는 주 작업이 멈춰 있었다고 명확히 알리고 재개했다. `○`(U+25CB)의 원본 이항 연산자 분류를 `layout.ts`에 반영했다. 독립 원본 `a○b`, `box{``○``}`, `○~○` 세 사례에서 양쪽 간격이 실제 HWPX와 일치한다. raw Unicode 기호에는 기존 키워드 기호 분류도 적용한다.

최신 결과는 전체 **3,830/4,158**, 잔여 **328개**다. 기존 24/24 유지. `job0058`만 별도로 실행한 검사는 **314/314** 전부 통과했다. 빌드 및 편집 검사 11/11도 통과. `summary.json`과 `web-metrics.json`이 최신이다. `height-only-cases.json`은 너비가 일치하고 높이/baseLine이 다른 134개를 모은 독립 native 실패 목록이다.

Windows 기존 Codex에 원본 `ctx+0x848`·첨자 배치·Roman 변환 관련 기존 C/asm/분석 문서의 읽기 전용 정적 조사를 지시했다. 새 Hwp/COM/GUI/request/바이너리 실행은 금지했다. 이 조사 완료 보고와 산출물을 주 에이전트가 직접 회수한다. 작업 실행 수락을 분석 완료로 간주하지 않는다.

조사 결과 회수·직접 코드 검토 완료: `script-height-static-audit.json` SHA256 `b8ff7f7f263af7c178a6fd3dce26eec95eb134b9cce14419ed6b42fcbf65c584`, C/asm 92함수 ZIP SHA256 `65f678eeb275531ecac93ada49e9c8ad1cf730a7c7e878b0ccf78ad54efdbc1c`. 첨자 0x1008e270의 20/25% 입력은 자식 측정 후 ctx+0x848 요청 크기, 문자 0x1008b480의 높이는 별도 Hnc SIZE.cy다. 0x10084f60 및 0x10084610의 Roman remap/fallback도 직접 읽었다. 보정 상수를 적용할 근거는 아직 없다.

후속 메모리 DC 측정 코드·결과 `script-height-gdi-probe.zip` SHA256 `16e9c45b977cf02d38ef075673c4b8a8457e1c7e94399f098d921f290ba7dc51` 회수·확인 완료. 630행, extent API 1,260회에서 두 API의 cy 차이 0, cy×75와 기존 모델 차이 0, 측정/cleanup 오류 0. 폰트 70개와 DC 1개 모두 정리했다. 따라서 일반 GDI 문자 높이를 바꾸는 가설은 이 측정으로 지지되지 않는다. Hnc 래퍼는 활성 논리 매핑 및 run 높이를 사용하며 raw GDI와 동일하다고 가정할 수 없다. Hnc wrapper 정적 C/주소·반환 단위 근거도 같은 폴더에 보존했다. 해당 native 저장 문맥의 크기/매핑/노드 상속 순서는 아직 미확정이며 높이 차이를 해결했다고 주장하지 않는다. 담당 결과 회수 후 idle 복귀를 확인했다.

---

## 2026-10-23 복구 후 수식 엔진 개발 재개 — 원본 24/24, 추가 3,827/4,158 메트릭 일치

사용자 「윈도우 연결했으면 작업 이어서 해」에 따라 수식 엔진을 실제 수정했다. `src/engine/layout.ts`에 적분·극한·합계 측정/글리프 배치와 상하한 연결, 괄호별 측정·늘임 조각(`delimiters.ts`), cases/행렬 외곽 괄호와 정렬, REL 화살표/위아래 중괄호, 중첩 첨자 및 괄호 없는 스타일 첨자, BOX/PHANTOM, 일부 잘못 닫힌 괄호 처리 등을 연결했다. 함수 앞 간격·기울임, 마지막 연산자 뒤 불필요 간격, 실제 baseLine 정수 경계 규칙도 수정했다. 메트릭 일치는 글리프 픽셀 일치 또는 모든 수식 문법 지원을 뜻하지 않는다.

기존 Windows Codex `term_63105ff9-2455-4b16-a4a0-62e745ccf27a`가 기존 native 저장 파일 job0057/0058/0059를 읽기 전용으로 복사했다. 생성 코드·완료 기록·원본 해시·수식별 metadata가 있는 ZIP을 Linux `verification/equation-corpus/2026-10-23/`에 회수하고 SHA256을 확인했다. 총 4,158개이며 같은 문자열이 여러 크기로 포함된다. 기존 24개만 맞춰 전체 일치라고 하지 않는다.

같은 Windows 담당이 CreateCompatibleDC(None)/CreateFontW/GetCharWidth32W로 화면과 분리된 메모리 DC에서 글꼴 폭을 측정했다. 최종 `gdi-font-widths-full.json`은 46개 (H,W), 647문자, 2폰트, 59,524행이다. 측정 오류 0, 정리 오류 0, 폰트 92/92와 메모리 DC 1/1 삭제를 확인했다. 폰트 cmap 지원 문자만 `scripts/prepare_gdi_widths.py`로 `src/engine/gdi-widths.json`에 반영했다. HYhwpEQ 우선, 없는 문자는 지원이 확인된 Haansoft Batang 폭만 사용한다. 미측정 크기/문자는 기존 계산식으로 fallback하므로 전체 크기 일치를 주장하지 않는다. 폰트 원본과 OS/API provenance는 원본 JSON에 보존했다. 새 Hwp/COM/GUI 조작·desktop request·Astris 변경은 없으며 담당 완료 보고와 idle 복귀를 확인했다.

검증 결과:

- `python3 scripts/check_native_equation_metrics.py`: 기존 native job0043의 24/24 폭·높이·baseLine 일치(재개 전 15/24).
- `python3 scripts/check_native_equation_metrics.py verification/equation-corpus/2026-10-23 --report verification/equation-corpus/2026-10-23/web-metrics.json`: 3,827/4,158 일치, 331개 불일치로 exit 1을 의도대로 유지. 기대값은 Python eq8 출력이 아닌 실제 HWPX의 sz/baseLine에서 추출한다. `summary.json`에 크기별 집계·원본 해시·남은 차이가 있다.
- `npm run build`, `python3 scripts/test_editor_workflows.py`: 통과, 11/11. 새 통합 검사는 실제 native 문서의 적분/극한/cases/절댓값/행렬 5개를 편집창에 입력하고 SVG 크기와 필수 기호를 검증한다. 합계 기호 출력도 확인한다. 적분 캡처 `editor-integral.png`를 직접 열어 확인했다. 이는 픽셀 대조 검사가 아니다.
- 그룹 뒤 대문자 첨자 간격 후보는 전체 표본에서 기존 통과식 2개를 깨뜨려 제외했다. 임의 식별 보정값으로 실패를 감추지 않았다.

최종 현재 빌드의 `python3 scripts/test_pwa_upgrade.py`도 1/1 통과했다. 작성 문서 보존·구형 캐시 교체·오프라인 재시작을 확인했으며 실제 사용자 Windows 설치형 앱 화면을 확인했다는 뜻은 아니다.

추가 배포 없음. 다음 분석 대상은 `web-metrics.json`의 331개 실패다. 특히 첨자 높이(크기별 5/10/13/25 HU 등), 그룹/함수 주변 간격, 직접 입력한 ○의 분류와 malformed syntax가 남아 있다. HWPX 파일 저장·본문 줄배치·전체 UI 및 픽셀 일치는 여전히 미완료다.

---

## 2026-10-23 07:14 KST 세션 복구 확인

사용자 「세션이 죽었어. 복구해줘」에 따라 기존 대화와 미커밋 파일에서 작업 문맥을 복원했다. 이전 로컬 대화는 `01a16275-a465-7d92-ab30-8c5f65d775ac`이며, 마지막 진행 지점은 수식 24개 중 폭·높이·기준선 15개 일치(`verification/native-equation-metrics-24-after-lexer.json`), HWPX ZIP/XML 읽기 모듈과 브라우저 읽기 검사까지다. HWPX 저장·왕복 및 남은 수식 9개는 미완료다. 아래 21:50 기록 이후 `src/document/hwpx-reader.ts`와 HWPX 원본 회수까지 진행된 점을 우선한다.

Windows 이전 작업 `term_780a0185-5bac-430f-ab58-e7a8633f0102`는 `operator_close` 종료를 확인했다. 기존 대기 Codex `term_63105ff9-2455-4b16-a4a0-62e745ccf27a`에서 읽기 전용 복구 진단을 수행했고 완료 보고와 `tui-idle.satisfied=true`를 확인했다. 새 에이전트는 만들지 않았다. 이 핸들은 목록에서 orphaned로 표시되지만 실제 send/read와 진단 완료가 확인되었다. 이후 사용할 때도 생존 상태를 다시 조회한다. GUI/COM 조작과 request 생성은 수행하지 않았다.

Windows와 Linux의 `verification/hwpx-roundtrip/2026-10-22/` 아래 3개 파일 SHA256이 모두 일치한다:

- `hwpx-fixtures-partial-2.zip`: `43fe2b966dc82cd8db8127334fc5647df256953b2e4ef8e99443ee5501ad014d`
- `hwpx-roundtrip-manifest.json`: `82e5074ca8b59b5e4ac28a2fdb5c0f7d139604889284f2f274f667913dc99f53`
- `rea-source-reference.zip`: `cb78e97036dd1418e5f5e7538a19fc71ddd39e5aa11fecc3a93887782f0bddfc`

복구 시 `npm run build`와 `python3 scripts/test_editor_workflows.py` 10/10 통과. 원본 HWPX 신규 4종 생성·재열기는 여전히 미완료이며 파일 회수와 혼동하지 않는다. 배포 승인 2회는 이미 소진되어 추가 배포 금지를 유지한다. 다음 재개 지점은 남은 수식 9개의 원본 계산 규칙 대조다.

---

## 21:50 이후 로컬 수식 편집기 — 재배포 이후 개발분, 아직 배포 안 함

`EquationEditor.tsx`를 추가해 기존640x420임의프리뷰모달을950x400 원본구조로교체했다. 원본도구줄 이미지+실제분수/근호/위아래첨자/undo/redo/삽입버튼,11pt/200% 초기값과실제변경,위쪽시각입력·아래쪽명령입력양방향연결,드래그/키보드분리선,창이동/resize,시각커서/선택/분수placeholder/방향키/기본Tab과원본Esc확인넣기·나가기·취소를구현했다. 모든도구와동작을완성했다는뜻이아님. 시각서식·색상·다른템플릿/메뉴·전체IME/클립보드·모든선택삭제규칙·픽셀렌더가미완료다.

렌더러파서는sourceStart/sourceEnd메타데이터,레이아웃은원문범위→좌표/빈칸노드를추가(일반본문렌더는placeholder없음). 타입스크립트엔진의소스범위를사용해커서와실제입력을연결했고placeholder선택후즉시타이핑시requestAnimationFrame이늦어입력이밖에들어가던경쟁을useLayoutEffect로해결했다. CSS url(./hwp_...)도단일HTML에인라인하도록번들러수정. 수식size를data-hwp-equation-size로저장·재편집복원. 새수식은빈내용으로열림.

Windows 실제원본CF_UNICODETEXT를회수: a+b, { } over { }, {1} over {2}. verification/equation-behavior-contract.json에실제원본출처와geometry/Esc행동기록. NativeEsc확인창326x158에서수정내용넣을지물음,취소/Esc는수식편집으로복귀,나가기는버림,변경없는재편집Esc는닫음. 이원본행동을기존즉시닫기테스트대신검증한다.

원본a+b와웹의글리프ink비교는아직불일치: 원본b bbox(58,112,70,133)/plus(31,113,52,132)/a(11,120,25,133), 웹b(57,113,69,135)/plus(31,109,51,128)/a(13,121,27,135). 주원인의하나는SVGdominantBaseline=hanging과GDITA_TOP의차이로의심되지만아직수정검증안됨. 눈대중오프셋으로0px라하지않는다. 정확한글꼴/GDI메트릭·좌표·렌더링검증이필요.

수식참조수집은Windows완료: behavior-reference-manifest.json status requested_native_behavior_reference_verified. 원본최대화100/110쌍과사용자제공용지범위정확일치검증,메뉴/분리선/삽입/재편집/취소/실제문자열및클립보드복원완료. 전체UI완성아님. 설치형PWA실창은Windows에서찾지못해CtrlR실행0,캐시·문서변경0. Linux공개주소검증과실제사용자PC업데이트검증을혼동하지말것.

다음Windows작업은실제HWPX empty/text/equation/table4기준파일생성·재열기·해시검증과eq8.py읽기전용의존성조사다. 같은기존Codex에전달했고신규계정/모델/세션변경없음. 매120초request·입력60초·OS잠금·원문경계반환유지. 완료물 hwpx-fixtures.zip를18976원본캡처회수서버에서회수할예정. 공식HWPX출처 https://tech.hancom.com/hwpxformat/ , https://tech.hancom.com/python-hwpx-parsing-2/ . 저장/열기는여전히plaintext위장상태이므로우선핵심미완료로남아있다.

---

## 21:30 화면 수정 재배포 완료 — 전체 일치 작업 계속

사용자 「이것부터 고치고 재배포해」 승인으로 **화면 수정 재배포 1회 완료·소진**. 공개 주소 https://web-hwp-rea.vercel.app/ , build `8785fef8cce66ea7`, 상세배포 ID는 verification/screen-correction/release.json. 이후 추가 배포는 새 승인 없이는 금지. 기존 최상단의 ‘이후 추가배포금지’는 이전 배포 기록이며 이번 별도 승인/완료가 최신이다.

사용자 최신 목표: 겉모양만 구현하지 말 것. 상단 표식은 Web HWP 테마 #f4b487, 나머지는 실제 한글 외형/기능/커서/음영/속성창/수식편집기 모든 세부 동작을 일치시킨다. docs/PARITY_WORKLIST.md에 영구 기록. 21:15 예약은 생성되지 않았으며 사용자가 즉시재개를 지시해서 재개했다. 명시 목표 create_goal active, 목표전체달성 전 complete 금지.

새 구현: DocumentScrollBar.tsx(트랙/드래그/키보드/휠과 실제scrollTop/scrollLeft 연결), 브라우저scrollbar 숨김으로 중복 제거; app viewport 28px left ruler/13px right bar, 29px 문서탭+24px 상태줄; 배율110기본/25..500 실제문서스케일·localStorage·하단컨트롤연결; 사용자 110% 화면(native.png,1918x1031)의 용지외곽 x527,y225,w879로 일치. 100%795/796px,110%878/879px 실측 view-frame 보정만 적용하며 HWPX mm규격 변경아님. viewport높이913/1031에서도 footer크기고정. 상단로고만살구테마로교체. 일반버튼 hover/pressed 블루오버레이를 nativegray로교체(전체버튼상태검증아직미완료).

PWA 원인: 기존 SW index.html revision:null + 번들러의register제거로 옛UI가설치형캐시에고정됨. service_worker.js는 최종번들hash캐시, navigation network-first+offlinefallback, 캐시승계시작성문서localStorage유지. activate에서 client.navigate를 await하면 activation과navigation이교착돼 테스트에서 재현했고 await를제거해해결했다. vercel.json sw.js/release.json no-store. 실제 구형Workbox설치캐시→새버전자동전환→문서보존→오프라인재시작 자동검증 통과.

검증: npm run build; test_editor_workflows.py 8/8; test_pwa_upgrade.py 1/1; verify_user_screen.py 전체1918x1031/1919x913 geometry+실제scroll/zoom. 마스킹없는 full-screen diff: title1224/menu-ribbon-format1463/ruler1438/workspace10147/tabs-status1906 다른픽셀. 테마변경·원본캐럿·미완료컨트롤 포함하므로 전체0px 주장이 아님. live-check.json 공개배포에서 새build/용지정확좌표/bar중복없음/offline본문복원/JS오류0 검증.

다음: 원본 수식 편집기는 실측950x400, 상단2행 도구/하단 명령영역/가변분리선/기본11pt·200% 미리보기. 이전640x420임의렌더러모달을 원본 상태/행동 기반으로교체해야함. Windows Codex term_780a0185...가 behavior-reference-* 캡처/로그를수집중. 100→110 배율과 수식a+b/분수/방향키/Tab/삭제/분리선/삽입/재편집/취소, UIA좌표를기록. 참조수집완료후 같은잠금규칙으로 사용자PWA실창업데이트도확인하도록지시했다. 새로구현하는작업은 로컬에서이어간다. HWPX 진짜저장/열기와 문서배치보장, 남은버튼/대화상자/수식0오차 모두미완료.

---

## 최신 상태 — UI 1차 수정 1회 배포 완료, 이후 로컬 개선 중

2026-10-22 사용자 「지금하는거까지 하고 배포 1회하고 이어서해」에 따라 기존 배포 금지를 1회만 예외 처리했다. 배포 ID `dpl_6rykWoGmidNhxsZbmvd4nGzSPduE`, 공개 주소 https://web-hwp-rea.vercel.app/ . `verification/release-2026-10-22.json`과 `verification/live-release-check.json`에 기록. **허용 1회 소진. 이후 추가 배포 금지.** .vercelignore로 원격 캡처/개발 기록/루트 확인 이미지는 업로드에서 제외했다.

이번 배포: native 96DPI 실측 프레임 높이32/34/84/36/28px, 55px 문서탭+상태줄, 용지/눈금자 위치 보정. 메뉴 라벨은 리본 전환, 별도 화살표는 메뉴. 편집/입력/서식 리본과 주요 버튼 연결. font695x570/paragraph553x647/page661x682 실제 크기의 DOM 대화상자, 주요 서식/문단/용지 필드 적용 및 취소. UI는 완전 일치가 아니며 확장 탭·다른 리본·일부 필드 및 상태 미완료. 화면을 열 때 useEffect의 늦은 초기화가 사용자 입력을 덮어쓰는 경쟁을 useLayoutEffect로 수정했다.

`npm run build`, `python3 scripts/test_editor_workflows.py` 8/8 통과. 실제 원본 입력/서식 도구영역 x1..1253,y66..149와 세로방향 버튼4상태만 픽셀 일치 검증. 대화상자는 크기·적용·취소 검증이며 전체 픽셀 일치 주장이 아니다. 공개 주소 HTTP200, 브라우저 오류0, 입력 탭 수식 버튼/SVG삽입/새로고침 복원/글자모양 창을 직접 검증했다. HWPX 진짜 왕복 저장 및 문서 배치 일치는 아직 미완료.

Windows Codex가 `ui-reference-manifest.json`, 검증 ZIP을 완료. 전체32캡처 중27채택/5거절, 메뉴8개 라벨/화살표와 대화상자5개, HWND/UIA/좌표/DPI/인계 기록. Linux에 회수했고 주요 화면/리본/글자/문단/용지/표 이미지를 직접 열어 확인했다. 늦게 렌더된 원본 서식/문단/용지 캡처는 재촬영본만 사용한다. 전체 미리보기는 `verification/deployed-ui-2026-10-22.png`, 배포 이전은 `verification/deployed-1327.png`.

다음: 확보한 보기/쪽/보안/검토/도구 원본을 대조하여 편집 리본이 잘못 남아 있는 문제와 해당 버튼 동작을 로컬에서 수정. 확장 탭·native 필드 전부·커서/호버/눌림 상태 및 HWPX/줄 배치까지 계속해야 한다. 본문 기본서체·브라우저 줄간격은 한글 문서 엔진과 동일하지 않음.

---

# Web HWP 개발 인계 — 2026-10-22

## 18:19 이후 재개 상태

사용자가 대기 지시 뒤 다시 `진행해`라고 했다. Astris 총괄의 최신 화면 기록에는 upper-0051을 완료까지 실행하고 upper-0052는 시작하지 않는다고 되어 있었다. Astris 큐를 임의로 중단하지 않고 기존 합의의 120초 request와 공용 OS 잠금으로 원문 경계에서 제어권을 얻는다.

이전 Windows Codex `term_e82f66b7-ab59-4712-8595-446cbf0a4c1a`는 operator_close로 종료됐다. Orca 감독 Run `run_3313874afc28`, Task `task_f0a1b1579cbb`를 만들었으나 원격 worker-start는 훅 검토 및 원격 terminal recognized-agent 오류로 3회 실패했다. 마지막 Dispatch는 `ctx_7b1a72041c5b`; 실패 상태를 보존하고 이 경로의 재시도는 중단했다. 새 Run/관련 없는 Dispatch로 우회하지 않는다. 실패한 사전 시작에서 남은 `term_63105ff9-2455-4b16-a4a0-62e745ccf27a`는 작업을 전달하지 않은 idle Codex다.

정상 terminal create로 연 Windows Codex `term_780a0185-5bac-430f-ab58-e7a8633f0102`의 입력 대기를 확인했고, 직접 지시/terminal read로 결과를 감독하는 방식으로 전환했다. 신규·변경 훅은 신뢰하지 않고 계속하도록 선택했다. 요청 `4148cf76-5771-420f-b3dd-f1b2c706fe94`에서 `input_accepted`, `turn_started`를 확인했다. 이 작업은 활성 Dispatch가 없는 일반 터미널 작업이므로 lifecycle ID를 추정하거나 worker_done을 보내지 않는다. 감독 연결 실패를 실제 캡처 실패/성공으로 혼동하지 않는다.

담당 범위는 수정된 guarded-retry.py와 retry2 소스 검토를 이어 실제 원본 UI/커서 상태를 캡처하고, 잠금 획득·반환 및 산출물을 보고하는 것이다. 아직 캡처 완료 증거는 받지 않았다. 주 에이전트가 직접 산출물을 회수하고 이미지를 열어 검증한다. Tailscale 회수 서버는 현재 `100.105.111.56:18976`에서 응답한다. 수집기는 `--manifest`로 retry2처럼 별도 이름의 manifest를 받을 수 있도록 보완했다.

## 추가 사용자 요구와 Windows Codex 시작

사용자는 원격 PC의 Codex 창을 보지 않으며, 주 에이전트가 지시·결과 회수·실제 검증까지 담당하라고 정정했다. Linux AGENTS.md의 5절에 영구 기록했고 Windows Codex도 원격 AGENTS.md에 같은 운영 책임을 추가했다. 다음 행동을 사용자에게 PC 창 확인으로 안내하지 않는다.

주 에이전트가 원격 결과 폴더만 대상으로 Tailscale 주소 `100.105.111.56:18976`에 임시 회수 서버를 시작했다. 해당 서버의 Orca 핸들은 `term_ba1bf229-9392-4ed9-b854-f010fede273d`다. `scripts/collect_native_baseline.py`로 manifest와 캡처·커서 파일을 Linux에 회수하고 SHA-256 영수증을 작성한다. 공개 배포가 아닌 원격 작업 증거의 내부 회수다. 회수 서버는 더 이상 사용하지 않을 때 중단한다.

1차 작업 결과 `first-pass-report.json`과 Windows 규칙 원문 `remote-rules.txt`까지 포함해 16개 파일을 회수했다. Windows AGENTS.md의 운영 책임 5항목을 원문으로 확인했다. 원본 캡처 확보 결과는 `failed_to_obtain_valid_foreground_baseline`이며 정상 0개, 거절 3개다. 전경은 다른 수식 편집기(PID 27772), 전용 대상은 PID 4032/HWND 985892였다. HWPX/PDF 생성은 전용창 안정성 확보까지 보류했다. Windows Codex는 해당 1차 결과를 보고하고 입력 대기 상태로 돌아갔다. 결과 회수 완료 후 전송용 서버에 인터럽트를 보냈다. 다음 작업은 다른 Windows 네이티브 작업과 UI 제어 시간을 조정하고, 안정적인 전용 전경을 확인한 뒤 상태별 촬영을 재개하는 것이다. 사용자 수동 조작은 필요하지 않다.

첫 editor-initial 캡처를 직접 열었더니 다른 문서 및 수식 편집기 창이 겹쳤다. 주 에이전트가 거절하고 재촬영 조건을 전달했다. Windows Codex는 전경 창 경합과 SetForegroundWindow 실패를 보고했고, 1차 기준 캡처는 모두 rejected로 정리 중이다. 이미지 다운로드를 성공적인 기준 수집으로 간주하지 않는다. 전용 상주 COM 처리 프로세스의 종료를 무한히 기다리지 말고 개별 응답과 manifest를 명령당 20초 이내로 관찰하도록 후속 지시했다.

사용자는 웹에서 편집한 파일을 실제 PC 한글에서 열었을 때 줄간격·한 글자 단위 줄바꿈·쪽나눔·크기·위치가 같아야 함을 명시했다. 메뉴 이미지의 유사도보다 문서 배치 및 저장 파일의 일치가 우선이다. 커서가 닿았을 때의 포인터 모양, 버튼의 hover/pressed/focus/disabled/checked 상태도 실제 캡처로 수집해야 한다.

사용자가 Windows 작업을 Codex 세션으로 열어 진행하라고 명시했다. `orca-ide computer capabilities --environment 'home window-pc' --json`에서 Windows screenshot/click/typeText/pressKey/hotkey/scroll/drag 지원을 확인했다. 기능 선언 확인이며 모든 GUI 작업의 실제 성공을 뜻하지 않는다.

Windows 기존 작업 공간 `0299125f-efe1-42b1-8a56-4bb6c761d178::C:\Users\K\Desktop\Claude\Web HWP REA`에 Codex를 시작했다. 터미널 핸들은 `term_e82f66b7-ab59-4712-8595-446cbf0a4c1a`, 표시된 모델은 GPT-6.1-Sol medium이다. 신규/변경 훅 검토에서는 훅을 신뢰하지 않고 계속하는 항목을 선택했다. Orca가 이전 훅 검토 상태를 유지했지만 Ctrl+L로 화면을 갱신한 뒤 `tui-idle.satisfied: true`가 확인됐다.

Windows 원본 환경 조사, 기본 편집창·리본 버튼 1개·I-beam의 상태별 캡처와 커서 hotspot 수집, JSON manifest, 후속 HWPX/PDF 테스트 문서 생성을 전달했다. 요청 ID `25694216-1704-4ce7-8dda-3b95bfc7a50b`에서 `input_accepted`와 `turn_started`를 확인했다. 작업 시작 증거이며 캡처 완료 증거는 아직 없다. 산출물 위치는 Windows 프로젝트의 `verification\native-baseline\2026-10-22`다. Linux 소스 수정과 충돌하지 않도록 Windows는 측정·캡처·테스트 문서 생성만 담당하고, pull/reset/소스 덮어쓰기/배포 및 다른 Astris 작업 변경은 금지했다.

## 작업 소유권과 사용자 요구

사용자가 같은 작업 폴더의 agy 세션 내용을 Codex가 이어받아 Web HWP 구현을 진행하도록 요청했다. Orca `orchestration` 및 `orca-cli` 가이드를 읽고, agy 터미널을 읽은 뒤 인계 요약만 요청했다. agy의 인계 답변을 전부 받은 상태다. agy 종료 이후에도 이 파일과 소스에서 이어서 진행한다.

- 작업 폴더: `/home/k/projects/Web HWP REA`
- 인계받은 agy 핸들: `term_90d66b46-3a4b-4930-97fb-264c47a351c5` (재시작하면 달라짐)
- 우선 요구: 버튼 위치·크기·실제 동작 정상화, 창 크기 대응, 로컬 자동 대조. 배포 금지.
- 기존 미커밋 `App.tsx`, `index.html`, `dist/index.html` 및 이미지 파일은 사용자 작업으로 보존했다.

## agy가 인계한 상태

`App.tsx`의 Slice, 메뉴·리본·서식줄 클릭 좌표, savedRange/focusEditor, 단일 HTML 번들러 수정이 기반이다. agy는 클릭 판정과 이미지 일치율을 보고했지만, 본문 삽입·저장까지 검증한 결과는 아니었다. 기존 Python 수식 대조 로그는 외부 `eq8`을 호출하므로 웹 TypeScript 엔진의 정확도 증거로 사용하면 안 된다.

Windows `home window-pc`는 Orca 조회에 응답한다. 조회 당시 `한글 REA` 터미널은 있었지만 `Web HWP REA` 전용 터미널은 없었고, `hostScope`에 누락된 호스트도 있었다. 전체 Windows 상태를 확인했다고 간주하지 않는다. 다른 Astris 작업용 터미널에는 명령을 보내지 않았다. 기존 `scripts/win_term.sh`는 bare `orca`를 사용하므로 이 Linux 세션에서는 실행하지 않았다. 이 세션에서 검증한 바이너리는 `orca-ide`다.

## 이번 구현과 검증

수식 삽입 버튼이 본문에 아무것도 넣지 않는 동작을 Chromium에서 재현했다. 본문 선택 영역을 복원하여 표·수식·문자표·도형·차트·그림 삽입 및 글자 모양을 적용하도록 연결했다. 수식은 SVG 개체로 삽입하고, 원본 스크립트는 data 속성에 보존한다. 더블클릭 편집, Shift+Escape 적용, Escape 취소, 삽입 실행 취소/재실행을 지원한다. HTML 본문 자동 저장으로 수식·표·글자 모양이 새로고침 후 복원된다. 기존 텍스트 저장 키는 호환용으로 유지한다.

분수선·근호선 길이가 1px로 고정되던 문제를 레이아웃 길이로 연결했다. Chromium은 원본 `HYHWPEQ.TTF`의 cmap을 `Range glyph reference too high (65535 > 617)`로 거부했다. 원본은 보존하고 cmap을 다시 기록한 `public/fonts/HYHWPEQ.web.ttf`를 추가했다. 단일 HTML에도 폰트를 인라인하므로 file:// 오프라인 로드가 가능하다. 글리프 모양과 메트릭은 원본을 유지한다.

최소 창 너비를 1916에서 960으로 수정하고, Slice의 왼쪽 레이어를 창 너비에 맞췄다. 960×662, 1204×662, 1916×918, 2560×1440에서 가로 넘침, 본문 범위, 창 버튼 위치, 42개 메뉴/리본/서식 좌표를 검증했다. 960px 미만 대응은 미완료다.

```bash
npm run build
python3 scripts/test_editor_workflows.py
python3 scripts/compare_editor_ui.py /tmp/right_native_1916.png
```

빌드와 브라우저 테스트 5개가 통과했다. 기존 Node 테스트는 프로젝트 의존성에 Playwright가 없어 그대로 실행되지 않으므로, 시스템 Python Playwright를 사용하는 위 테스트를 추가했다. 폰트 재생성은 fonttools가 필요하며 `python3 scripts/prepare_equation_font.py`로 실행한다. 생성된 웹용 TTF를 포함하므로 일반 빌드에는 fonttools가 필요 없다.

인계 세션에서 남긴 `/tmp/right_native_1916.png`를 기준으로 상단 219px 영역은 다른 픽셀 0개, 전체 화면은 30,287px 차이(정확 일치율 98.2781%)다. 이 이미지는 이번에 Windows에서 새로 촬영한 자료가 아니며 원본 촬영 경위는 독립 확인하지 않았다. `verification/pixel-comparison.json`에 참조 경로와 SHA-256을 기록한다. 전체 화면 오차 0px 및 수식 네이티브 일치는 달성하지 않았다. 현재 차이는 스크롤바·페이지 경계·작업 영역 하단 등에 집중된다.

## 다음 구현 대상

1. 저장/불러오기는 아직 실제 HWP/HWPX가 아니다. 현재 저장 버튼은 일반 텍스트에 `.hwpx` 확장자를 붙이고, 불러오기는 파일을 텍스트로 읽는다. HWPX ZIP/XML 문서 모델과 왕복 저장을 구현해야 한다. 자동 저장 복원과 파일 형식 지원을 혼동하지 않는다.
2. 로그인·바탕쪽·개체 선택/보호 등 토스트만 표시하는 기능, 미구현 메뉴 및 표마당/표속성 알림을 실제 동작으로 교체한다.
3. 상태표시줄·눈금자·활성 리본 이미지는 정적이다. 문서 상태와 연결하고 창 크기/쪽 방향에 맞춰 눈금자를 정렬해야 한다.
4. 외부 Python 엔진의 일치율 대신 TypeScript 엔진 출력과 Windows 원본을 직접 비교한다. 스크롤/종이 경계와 수식 글리프 좌표에도 잔여 차이가 있다.
