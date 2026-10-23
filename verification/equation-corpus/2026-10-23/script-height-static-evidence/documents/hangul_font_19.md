# 수식 안 한글 글자의 글꼴·폭 · HFT · 잔여 3건 — 19차 (2026-10-19)

근거: HwpPlugin.dll(Ghidra `C:\Users\K\tools\proj\plug`, 전체 디컴파일 덤프 `C:\Users\K\tools\work\r19\plug_all.c` — 저장소 밖), HncBaseDraw.dll(`bd`) 의 `CHncDrawContext::GlyphExist`.
자료: 모의고사 crop-0001 doc01~23(HWPX·PDF), 기출 HWPX 3개 — 한글 든 수식 **121개(고유 99)**. job-0040/0041(잔여 3건).
도구(`tools/`): `hangul19.py`(한글 수식 검증), `hgw19.py`(GDI 한글 폭·높이 글꼴별 측정), `fonts19.py`(글꼴 목록), `eq8.py`(⑤ 2건 반영).
기호: s = 노드 크기(HU), H = MulDiv(s,96,7200), W = MulDiv(s/2,96,7200) (96dpi px), 1px = 75 HU.

## 결론 한 줄
**수식 안 한글은 언제나 Haansoft Batang(한컴바탕, `Shared\TTF\All\HBATANG.TTF`) 한 글꼴로 재고 그림.** 문서 글자 모양(CharShape)은 쓰지 않음. 수식 글꼴 설정(HYhwpEQ/HancomEQN)에도 한글이 없어서 결과는 같음. 폭 = **2·W px × 75**, 높이·기준선은 다른 글자와 같음. 따라서 글꼴마다 따로 잴 필요 없이 식 하나로 됨.

## ① 글꼴 이름이 오는 곳 (코드 경로)

1. 한글(HwpApp)이 수식 하나를 잴 때 플러그인의 인터페이스 함수(가상 표 `0x100b0dc4`, 본체 `0x10005540` → `0x10086e90`)에 **크기와 글꼴 이름 문자열**을 넘김. 이 이름이 수식 속성의 글꼴임(자동화 `HEqEdit.EqFontName`, HWPX `<hp:equation font="…">`). 이름이 비어 있으면 앞서 쓰던 이름(`0x10086e10`)을 씀.
   - 확인: 모의고사 PDF 에 `HancomEQN` 글꼴이 실제로 박혀 있음(font="HancomEQN" 수식 84개). 즉 이 이름이 그대로 그리기 글꼴이 됨.
2. 글꼴 상태 객체(`+0x858` 에 현재 글꼴 이름)는 **7개 언어 칸(한글·영문·한자·일어·외국어·기호·사용자)에 같은 이름**을 넣음(`0x10084770`). 크기를 바꾸는 함수들(`0x10084560`, `0x100844d0`)도 이 이름을 다시 씀.
3. 글자 하나를 잴 때(`0x10084f60`)·그릴 때(`0x10084930`)·여러 글자를 한 번에 그릴 때(`0x10084cf0`) 먼저 **그 글자가 글꼴에 있는지** 봄(`0x10084610`):
   - 현재 이름이 `HYhwpEQ` 이면 HYhwpEQ 에 있는지만 봄.
   - 아니면 현재 글꼴 → 없으면 HYhwpEQ 순서로 봄.
   - 둘 다 없으면 이름을 문자열 자원 `IDS_EQ_LOG_FONTNAME`(한국어판 = 한컴바탕 = **Haansoft Batang**)으로 **잠깐 바꿔서** 재거나 그린 뒤 원래 이름으로 되돌림.
4. 한글 음절·자모는 HYhwpEQ 와 HancomEQN 둘 다 없음(cmap 확인, `fonts_19_windows.tsv` hangul=N). 그래서 **한글 → 항상 Haansoft Batang**.
5. **문서 글자 모양은 안 씀**: 플러그인에 들어오는 것은 글꼴 이름과 크기뿐임. 자료로도 확인함. 한글 든 모의고사 수식 58개가 놓인 문단 글자 모양의 한글 글꼴은 신명 중명조(HFT) 42개, KoPubWorld바탕체 Light 12개, 함초롬바탕 4개로 서로 다름. 그래도 PDF 의 수식 한글은 **문서 23개 모두 원문 한글 수 = Haansoft Batang 한글 수**(예: doc01 39=39, doc20 34=34)였고, 폭도 같은 식으로 맞음.

## ② 폭·높이·기준선 식

- 재는 법: `CHncDrawContext::GetTextExtentExPointW` 로 **GDI 진행폭(정수 px, 힌팅 반영)** 을 얻음. 글꼴은 lfHeight = −H, lfWidth = W(장평 100). 글꼴 파일 값(hmtx)을 크기에 맞춰 곱하는 방식이 **아님**.
- GDI 는 lfWidth 를 그 글꼴의 평균 폭(xAvgCharWidth)에 맞춰 늘이고 줄임. 그래서 진행폭(px) = 글자 advance × W / xAvgCharWidth 를 반올림한 값임.
  - Haansoft Batang 은 한글 advance 1024/1024, xAvgCharWidth 512 이므로 **한글 한 글자 = 2·W px**. 크기 400~3000(50 단위) 모두 GDI 실측과 같음(`hgw19.py`, 어긋남 0개).
  - 11pt(1100): W 7 → 14px = **1050 HU**. 9pt(900): W 6 → 12px = 900. 10pt 1050, 8pt 750, 14pt 1350, 20pt 1950. ㆍ(U+318D)도 같은 폭.
  - 다른 글꼴이면 이 식이 깨짐. 함초롬바탕은 W px(53개 크기에서 다름), 맑은 고딕은 약 2.2·W(48개 크기). HY신명조·바탕은 2·W. 그래서 **글꼴이 바뀌면 따로 재야 함**. 다만 수식 경로에서는 글꼴이 Batang 하나로 정해져 있으므로 이 식 하나면 됨.
- 높이: 글자 노드 높이 = 그 글꼴의 GDI 글자 높이(ascent + descent). 위끝 = −높이/2(`0x1008b480`). Batang(879+145)과 HYhwpEQ(820+204)는 크기 300~4000 전 구간에서 **GDI 높이가 같음**(어긋남 0개). → 한글 글자 상자 = 다른 글자와 같은 칸, MulDiv(s,96,7200)·75.
- 기준선: TA_BASELINE 으로 위끝 + 85%·글꼴높이 자리에 찍음(글꼴과 무관). PDF 에서 한글 기준선 = 이웃 HYhwpEQ 글자 기준선(doc03 `은자연수` 와 a·n 이 같은 2976px). 괄호 E044/E045 는 TA_TOP 이라 3~4px 다름(10차 식 그대로).
- 간격 분류: 한글 = 일반 글자(분류 1). eq8 이 이미 이렇게 하고 있음(14차 R14).
- 굵게(bold) 한글: GDI 가 1px 넓힘(1100: 15px = 1125). **실측 없음, 예측만**.
- 검증(`hangul19.py`): 한글 든 수식 121개 중 **폭 119/121**. 틀린 2개는 doc01 `{bar{rm AC}} TIMES … cos` 류의 −75 로, 한글이 없는 같은 식 8개에서도 똑같이 −75 가 남(rm 범위 문제, 한글 무관). 높이가 틀린 34개는 `cases{~ ^{it ^{it}} …` 의 +32/+34/+68 로, 한글 없는 같은 꼴 식에서도 같은 분포임(한글 무관, 열린 문제로 남김).

## ③ HFT 글꼴(신명 중명조 등)

- 신명 중명조는 **HFT 로만 있음**: `Shared\Fonts\TEJMJHG.HFT`(한글), TEJMJEN(영문), TEJMJHJ(한자). TTF 판은 없음(`fonts_19_hft.tsv`, `fonts_19_windows.tsv`).
- 본문(문단) HFT 글자는 한컴 자체 엔진이 그림. PDF 에서는 Type3 글꼴(T1~T18)로 나옴.
- 수식은 HFT 를 **쓰지 않음**. 플러그인은 `GlyphExist(이름, 종류=1, 글자)` 만 부름. HncBaseDraw 에서 종류 1 은 **TTF 글꼴 표**(이름 이진 탐색), 종류 2 가 HFT 표(언어별, 표시 비트 0x80000000)임. 그래서 HFT 이름은 수식 안에서 찾을 수 없음.
  - 문단이 신명 중명조여도 수식 한글은 Batang 임(① 5).
  - 수식 글꼴 이름 자체를 HFT 이름으로 바꿔도 한글은 HYhwpEQ 확인 → Batang 으로 감(코드 판독). 영문·기호가 어떻게 찍히는지는 GDI 대체에 따라 달라짐(**미실측**).

## ④ 이 PC 글꼴 목록 (읽기만 함)

| 파일 | 내용 |
|---|---|
| `fonts_19_registry.tsv` | HKLM(64·32비트 보기)·HKCU `…\Windows NT\CurrentVersion\Fonts` 454줄 |
| `fonts_19_windows.tsv` | C:\Windows\Fonts·사용자 Fonts·한컴 `Shared\TTF\All`·`Shared\TTF\Hwp` 의 글꼴 402개: 가족 이름(영/한), 한글 유무(145개), unitsPerEm, winAscent/Descent, hhea, '가' advance, GDI 목록에 보이는지 |
| `fonts_19_hft.tsv` | 한컴 설치 폴더 HFT 393개: 파일, 크기, 머리 이름 3개(조합형 해독). 신명 계열 77줄 |

- **Haansoft Batang 은 Windows 에 설치돼 있지 않음**(레지스트리에 없음, GDI 글꼴 목록에도 없음). 한컴이 `HBATANG.TTF` 를 따로 올려 씀. 그래도 이 PC 에서 `CreateFont("Haansoft Batang")` 은 한컴바탕을 돌려줌(한컴 쪽이 올려 둔 상태로 보임).
  - **ASTRIS 쪽 주의**: 한글이 없는 PC 에서 이 이름을 그냥 쓰면 다른 글꼴로 바뀜. `HBATANG.TTF` 를 직접 올리거나(`hgw19.py` 처럼 FR_PRIVATE) 폭 = 2·W px 식을 쓸 것.
- HyhwpEQ·HancomEQN 은 C:\Windows\Fonts 에 TTF 로 설치돼 있고 둘 다 한글 없음.

## ⑤ 잔여 3건

| 건 | 결과 | eq8 |
|---|---|---|
| `{BUILDREL rarrow {a}} over {q}` (lrarrow 판 포함 2식) | 한글 = **분모가 빈 칸(높이 s)인 분수 + 그 뒤에 q 를 이어 씀**. 즉 `{BUILDREL … {a}} over {} q` 와 같음. w 2100 = 분수 1650 + q 450, h 4049 = 2619 + 330 + 1100, q 는 분수 오른쪽에서 기준선이 줄과 같음. 2식 모두 w·h·bl·글리프 0px. 왜 그렇게 읽는지(파서 쪽)는 못 풀었음. BUILDREL(위 칸 있음)이 { } 끝에 오고 바로 over 가 올 때만 적용함 | **반영**(`EQ8_BRELOVER`) |
| BIGG 위첨자 `z ^{BIGG ( a}` | 폭·가로 자리는 **`z ^{BIGG (} a`** 와 같음(1350, ( 는 첨자, a 는 본문 크기로 본문 기준선에 붙음). 높이 1663 은 eq8 1313 보다 350 큼. 떼어 낸 a 의 본문 크기 높이가 첨자 상자에 남는 것으로 보임(미확정). `{BIGG ( a} over {q}` 는 a 가 분모 아래 x 288 에 찍혀 자리가 섞임 → 따라 할지 결정 필요 | 미반영 |
| 바깥 `{ }` 안 eqalign 폭 `u {eqalign{a # b}} v` | 한글 = **식 전체를 줄로 나눔**: 1줄 `u a`, 2줄 `b v`, 줄마다 x 0 에서 시작. w = 가장 넓은 줄(1125) | **반영**(`EQ8_GRPSPLIT`) |

검증(전 → 후, 같은 캐시):

| 자료 | 전 | 후 |
|---|---|---|
| job-0040 r16-rel (w·h·bl / 글리프) | 46 / 45 | **48 / 47** |
| job-0040 r16-misc | 41 / 26 | **42 / 28** |
| job-0040·0041 나머지 종류 | 그대로 | 그대로 |
| job 전체(0002~0039, 39,271식) | 85.45% | 85.45% (변화 없음) |
| 기출 / 모의고사 w·h·bl | 98.47% / 98.54% | 98.47% / 98.54% |
| 한글 든 수식 121개 | w 119 | w 119 |

## 미니 PC job 제안 (한글 사다리) — 선택

**목적**: ② 식(2·W px)과 ③(글꼴 이름이 HFT 여도 한글은 Batang)을 실측으로 닫기. 정적 분석과 기존 자료로 이미 맞았으므로 급하지 않음. 굵게·글꼴 이름 바꾸기만 미실측임.
**만드는 법**: 각 식을 BaseUnit 800·1000·1100·1400·2000 × EqFontName `HYhwpEQ`·`HancomEQN`·`신명 중명조` 로 만듦. build_doc.py 의 고정값 `BaseUnit=1100`·`EqFontName="HYhwpEQ"` 을 항목별로 바꿔야 함. 26식 × 5 × 3 = 390식(+ 대조 12).
지금 gen_list.py 는 한글 든 식을 빼므로 이 목록은 그 필터 없이 넣어야 함. 스크립트는 한 줄에 하나:

```
가
가나
가나다라
가 나
a가
가a
x=가
가=x
1가2
가`나~다
ㄱㄴ
ㆍ
한글ABC
abc한글
rm 가a
it 가a
bold 가
"가나"
x ^{가}
x _{가나}
{가} over {나}
sqrt {가}
LEFT ( 가 RIGHT )
BOX{~(가)~}
cases{1 & 가 # 2 & 또는}
{가} over {q} 나
```
예측(eq8, HYhwpEQ, 1100): `가` w 1050 h 1125 bl 85 / `가나다라` 4200 / `a가` 1575 / `x=가` 2937 / `BOX{~(가)~}` 3159. 크기별 `가`: 800 → 750, 1000 → 1050, 1400 → 1350, 2000 → 1950.
HancomEQN·신명 중명조 판에서도 한글 폭은 같다고 예측함(한글 글리프 = Haansoft Batang). `bold 가` 만 1125 예측(미확인). PDF 의 한글 글꼴 이름이 모두 `Haansoft Batang` 인지도 함께 볼 것.

## 조건
정적 분석 + 기존 자료 + 글꼴·레지스트리 읽기만 함. Hwp.exe 실행·종료 없음, poll_jobs.py 미접촉, 새 파일은 results/rea/ 만, push 없음. `hgw19.py` 의 AddFontResourceExW(FR_PRIVATE)는 그 파이썬 프로세스 안에서만 보이고 끝나면 사라짐(설치·레지스트리 변경 없음). subprocess 없음. 디컴파일 코드는 싣지 않고 식·주소만 적음.
