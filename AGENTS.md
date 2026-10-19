# Web HWP REA 작업 규칙 및 에이전트 연동 가이드

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
