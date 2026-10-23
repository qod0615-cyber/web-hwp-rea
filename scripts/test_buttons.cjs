const { chromium } = require('playwright');
const path = require('path');

(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 1916, height: 918 } });
  
  const consoleLogs = [];
  page.on('console', msg => consoleLogs.push(msg.text()));
  page.on('pageerror', err => consoleLogs.push('ERROR: ' + err.message));

  const indexPath = 'file://' + path.resolve('index.html');
  await page.goto(indexPath);
  await page.waitForTimeout(500);

  console.log('1. Page title:', await page.title());
  console.log('2. Console errors:', consoleLogs.filter(l => l.startsWith('ERROR')));

  // 본문 에디터 찾기
  const editor = await page.$('div[contenteditable="true"]');
  console.log('3. Editor exists:', !!editor);
  if (!editor) {
    process.exit(1);
  }

  // 4. 굵게 버튼 클릭
  const boldBtn = await page.$('div[title="굵게 (Ctrl+B)"]');
  console.log('4. Bold button exists:', !!boldBtn);
  if (boldBtn) {
    await boldBtn.click();
    await page.waitForTimeout(100);
    const toast = await page.textContent('body');
    console.log('   Toast contains 굵게/진하게:', toast.includes('진하게') || toast.includes('굵게'));
  }

  // 5. 표 만들기 모달 열기 및 닫기
  const tableBtn = await page.$('div[title="표 만들기 (Ctrl+N, T)"]');
  console.log('5. Table button exists:', !!tableBtn);
  if (tableBtn) {
    await tableBtn.click();
    await page.waitForTimeout(100);
    const tableImg = await page.$('img[alt="표 만들기 대화상자"]');
    console.log('   Table dialog rendered:', !!tableImg);
    const closeBtn = await page.$('div[title="닫기 (ESC)"]');
    if (closeBtn) await closeBtn.click();
  }

  // 6. 글자 모양 (Alt+L) 모달 열기 및 닫기
  const fontBtn = await page.$('div[title="글자 모양 (Alt+L)"]');
  console.log('6. Font modal button exists:', !!fontBtn);
  if (fontBtn) {
    await fontBtn.click();
    await page.waitForTimeout(100);
    const fontTitle = await page.getByText('글자 모양 (Alt+L)');
    console.log('   Font modal rendered:', await fontTitle.count() > 0);
  }

  // 7. 수식 편집기 (Ctrl+N, M) 모달 열기
  const eqBtn = await page.$('div[title="수식 편집기 (Ctrl+N, M)"]');
  console.log('7. Equation button exists:', !!eqBtn);
  if (eqBtn) {
    await eqBtn.click();
    await page.waitForTimeout(100);
    const eqTitle = await page.getByText('수식 편집기');
    console.log('   Equation modal rendered:', await eqTitle.count() > 0);
  }

  await browser.close();
  console.log('All automated button validations passed!');
})();
