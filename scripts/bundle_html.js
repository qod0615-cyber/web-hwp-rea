import fs from 'fs';
import path from 'path';

const htmlPath = path.resolve('dist/index.html');
let html = fs.readFileSync(htmlPath, 'utf-8');

function imgToB64(filename) {
  const filePath = path.resolve('public', filename.replace(/^\//, ''));
  if (fs.existsSync(filePath)) {
    const b64 = fs.readFileSync(filePath).toString('base64');
    return `data:image/png;base64,${b64}`;
  }
  return filename;
}

html = html.replace(/"\/(hwp_[^"]+\.png|pwa-[^"]+\.png)"/g, (m, file) => `"${imgToB64(file)}"`);
html = html.replace(/url\(\s*["']?\/(hwp_[^)'"]+\.png)["']?\s*\)/g, (m, file) => `url(${imgToB64(file)})`);

// file:// 프로토콜에서 에러를 유발하는 PWA / ServiceWorker 외부 스크립트 태그 제거
html = html.replace(/<link rel="manifest"[^>]*>/g, '');
html = html.replace(/<script id="vite-plugin-pwa:register-sw"[^>]*><\/script>/g, '');

fs.writeFileSync(htmlPath, html, 'utf-8');
console.log('Successfully bundled singlefile HTML with inlined assets!');
