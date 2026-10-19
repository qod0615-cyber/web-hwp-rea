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

fs.writeFileSync(htmlPath, html, 'utf-8');
console.log('Successfully bundled singlefile HTML with inlined assets!');
