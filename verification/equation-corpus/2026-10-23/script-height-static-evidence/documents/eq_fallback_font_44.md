# ⑭ 글꼴에 없는 기호(DAGGER·LDOTS·OHM·TRIANGLE·VecD 등) 대체 글꼴·폭 (정적 + GDI 44차)

주소 = EqAppModule.dll VA. 관측 = 코드/리소스/GDI 확인, 화면 확인 없음. 스크립트 `tools/probe_fb.py`(이 PC GDI `GetGlyphIndicesW`/`GetTextExtentPoint32W`).

## 1. 규칙 (관측)
1. **기본 글꼴**: 엔진 글꼴 객체 F 의 7개 언어 슬롯 face 이름 = `HYhwpEQ`(`DAT_1006b740`, 7글자). 글자 하나 측정/그리기 직전 `FUN_10011fd0`(0x10011fd0)이 **글리프 존재 검사**:
   - 코드 **0x00AC(¬)이면 무조건 "없음"(0 반환)** → ¬ 는 항상 대체 글꼴.
   - 현재 face 가 `HYhwpEQ` 가 아니면 현재 face 에서 `CHncDrawContext::GlyphExist(face,1,코드)`, 있으면 사용. 그 다음/현재 face 가 `HYhwpEQ` 이면 **`HYhwpEQ` 에서 `GlyphExist`**. 없으면 0.
2. **대체**: 존재 0 이면 `FUN_10012960`(측정, 0x10012960)이 `HncLoadStringW("IDS_EQ_LOG_FONTNAME")` 로 얻은 이름으로 **7슬롯 face 이름을 전부 교체**(`FUN_10012130`: `+0x24,+0xb8,+0x14c,+0x1e0,+0x274,+0x308,+0x39c` 와 F+0x858 문자열) → `FUN_100121e0` 으로 글꼴 재생성 → `GetTextExtentExPointW` 로 폭 측정 → 원래 이름으로 복원. **높이·폭 설정(lfHeight=size, lfWidth=size/2)은 그대로** 두고 이름만 바꾼다. 그리기(`FUN_100122f0`)도 같은 검사로 임시 교체 후 복원(29/34차).
3. 이 분기는 `m(F+0x850)==0` 경로 전체와 `m!=0` 경로의 **대문자 PUA(E000~E019) 이탤릭 경로가 아닌 모든 코드**에서 탄다.
4. **대체 글꼴 이름 = `IDS_EQ_LOG_FONTNAME`**: `Hnc.Office.String.ko-KR.dll` 리소스 값 **"한컴바탕"**, en-US 는 **"Haansoft Batang"** (`font_fallback_resource.json`; 한글 2022 ko-KR 기준 **한컴바탕**). 같은 face 로 GDI 가 해석(이 PC 에서 둘 다 같은 실제 face 로 열림).

## 2. 각 기호의 코드·존재·폭 (이 PC GDI, 29px 높이·15px 폭 = size 1100 @192dpi; 1px = 37.5 논리)
엔진 심볼표(`0x10095a28`, 간격 0x6c)에서 읽은 코드(@+0x3c, 글꼴 번호 @+0x3e=72, 분류 @+0x68):
| 이름 | 코드 | HYhwpEQ 에 글리프? (GDI) | 대체 글꼴 한컴바탕 폭 | HYhwpEQ 폭 |
|---|---|---|---|---|
| OHM | U+2126 | **없음**(폭 30=notdef) | 30px (=1125 논리) | — |
| LDOTS | U+2026 | **없음**(30=notdef) | **25px** (=938) | — |
| DAGGER | E0C9 | 있음 | 30px | **13px** |
| DDAGGER | E0CA | 있음 | 30px | **13px** |
| CDOTS | U+22EF | 있음 | 30px | 30px |
| TRIANGLE/D/L/R | 25B3/25BD/25C1/25B7 | 있음 | 30px | 30px |
| VecD | E0CE | 있음 | 30px | **22px** |
| ¬ (NOT) | U+00AC | 있음이지만 **코드 규칙상 항상 대체** | **24px** | 24px |
- 요청의 "글꼴에 없는" DAGGER·VecD·TRIANGLE 은 **이 PC GDI 로는 HYhwpEQ 에 있음**(E0C9/E0CE/25B3 모두 존재). 한컴의 `CHncDrawContext::GlyphExist` 가 GDI `GetGlyphIndices` 와 다른 기준(HFT 글꼴 범위표 등)일 수 있어, **대체 여부는 화면 폭으로 확인**: 화면에서 DAGGER 폭이 13px 이면 HYhwpEQ, 30px 면 한컴바탕 대체.
- 대체가 일어났을 때 폭(논리) = 한컴바탕 advance ×(7200/192) 반올림: OHM 30px→1125, LDOTS 25px→938, DAGGER/VecD/TRIANGLE 30px→1125, ¬ 24px→900. 노드 폭 = 이 값 + gap(T 표, 29차).
- 높이(cy)는 lfHeight=29(=size) 그대로 29px.

## 3. 그리기 위치 (관측)
`FUN_100122f0`: 코드가 E044~E084/E100~E105 가 아니면 TA_BASELINE, **y = 노드 y + S×85/100** 를 대체 글꼴에서도 그대로 사용 → 글자 ink 의 세로 위치는 한컴바탕 글리프의 ascent/descent 에 따라 HYhwpEQ 글리프와 다름(기준선은 같음). E0C9·E0CE 같은 PUA 는 HYhwpEQ 에 있으면 위 baseline 식. LDOTS(2026)·OHM(2126) 은 E044~E084 범위 밖이라 **baseline 식(+0.85S)** 적용.

## 4. 미확정
`GlyphExist` 구현(HncDC.dll)과 한컴의 실제 대체 판정 목록 — 화면에서 DAGGER 폭 13 vs 30px 로 확정 가능. OHM·LDOTS 만 GDI 와 일치해 대체될 것으로 예측.
