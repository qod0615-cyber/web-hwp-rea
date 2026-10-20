import { chromium } from 'playwright';
const b = await chromium.launch(); const p = await b.newPage({viewport:{width:1916,height:918}});
const errs=[]; p.on('pageerror',e=>errs.push(e.message));
await p.goto('file:///home/k/projects/Web%20HWP%20REA/index.html'); await p.waitForTimeout(600);
const at=(x,y)=>p.evaluate(([x,y])=>{const e=document.elementFromPoint(x,y);return e?(e.title||e.tagName):null},[x,y]);
const T=26+32; // ribbon top 58 ; format top 141
const rib=[[33,'오려두기'],[79,'복사하기'],[130,'붙이기'],[172,'모양 복사'],[220,'조판'],[282,'글자 모양'],[320,'문단 모양'],[360,'스타일'],[415,'세로'],[453,'가로'],[505,'쪽 여백'],[549,'바탕쪽'],[590,'단'],[641,'도형'],[679,'그림'],[717,'표'],[755,'차트'],[819,'개체 선택'],[873,'개체 보호'],[932,'찾기']];
for (const [x,n] of rib){const t=await at(x,T+30); console.log(t&&t.includes(n)?'OK ':'BAD',n,x,'->',t);}
const men=[[30,'파일'],[96,'편집'],[163,'보기'],[222,'입력'],[281,'서식'],[334,'쪽'],[388,'보안'],[447,'검토'],[506,'도구']];
for (const [x,n] of men){const t=await at(x,26+16); console.log(t===n?'OK ':'BAD',n,x,'->',t);}
const F=141+18; const fm=[[28,'새 문서'],[70,'불러오기'],[112,'저장하기'],[169,'인쇄'],[195,'미리'],[236,'되돌리기'],[278,'다시'],[795,'진하게'],[821,'기울임'],[847,'밑줄'],[480,'대표'],[380,'스타일'],[590,'글꼴'],[710,'글자 크기']];
for (const [x,n] of fm){const t=await at(x,F); console.log(t&&t.includes(n)?'OK ':'BAD',n,x,'->',t);}
// functional
await p.click('div[contenteditable]'); await p.keyboard.type('hello world'); await p.keyboard.press('Control+A');
await p.mouse.click(795,F); console.log('bold html:',await p.evaluate(()=>document.querySelector('[contenteditable]').innerHTML));
await p.mouse.click(719,T+30); console.log('table modal:',await p.evaluate(()=>!!document.querySelector('img[alt="표 만들기 대화상자"]')));
console.log('errors',errs); await b.close();
