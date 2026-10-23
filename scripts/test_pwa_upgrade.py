"""Upgrade a real stale installed-app cache, retaining the document; verify offline restart."""
import json
import threading
import unittest
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
OLD_HTML = b'''<!doctype html><html><body><main id="old-ui">legacy stretched ruler</main>
<script>navigator.serviceWorker.register('/sw.js');</script></body></html>'''
OLD_WORKER = b'''self.addEventListener('install', e=>e.waitUntil((async()=>{
const c=await caches.open('workbox-precache-v2-web-hwp-legacy');
await c.put(new URL('/index.html',self.location.origin),new Response(await (await fetch('/old.html')).text(),{headers:{'Content-Type':'text/html'}}));
await self.skipWaiting();})()));
self.addEventListener('activate',e=>e.waitUntil(self.clients.claim()));
self.addEventListener('fetch',e=>{if(e.request.mode==='navigate')e.respondWith(caches.match(new URL('/index.html',self.location.origin)));});'''


class PwaUpgrade(unittest.TestCase):
    def test_legacy_installed_app_upgrades_and_retains_document_offline(self):
        state = {'new': False}

        class Handler(BaseHTTPRequestHandler):
            def do_GET(self):
                request_path = self.path.split('?')[0]
                if request_path == '/sw.js':
                    body = (ROOT / 'dist/sw.js').read_bytes() if state['new'] else OLD_WORKER
                    mime = 'application/javascript'
                elif request_path == '/old.html' or (request_path in ['/', '/index.html'] and not state['new']):
                    body, mime = OLD_HTML, 'text/html'
                else:
                    file = ROOT / 'dist' / ('index.html' if request_path == '/' else request_path.lstrip('/'))
                    if not file.is_file():
                        self.send_error(404)
                        return
                    body = file.read_bytes()
                    mime = 'text/html' if file.suffix == '.html' else 'application/manifest+json' if file.suffix == '.webmanifest' else 'application/json' if file.suffix == '.json' else 'image/png'
                self.send_response(200)
                self.send_header('Content-Type', mime)
                self.send_header('Cache-Control', 'no-store')
                self.end_headers()
                self.wfile.write(body)

            def log_message(self, *_):
                pass

        server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        try:
            with sync_playwright() as runtime:
                browser = runtime.chromium.launch()
                context = browser.new_context(viewport={'width': 1918, 'height': 1031})
                page = context.new_page()
                page.goto(f'http://127.0.0.1:{server.server_port}/')
                page.evaluate('async()=>await navigator.serviceWorker.ready')
                page.reload()
                self.assertEqual(page.locator('#old-ui').count(), 1)
                page.evaluate("localStorage.setItem('web_hwp_current_html','<p>업데이트 전 작성한 문서</p>')")
                state['new'] = True
                page.evaluate('()=>{navigator.serviceWorker.getRegistration().then(r=>r.update()).catch(()=>{});}')
                build = json.loads((ROOT / 'dist/release.json').read_text(encoding='utf-8'))['build']
                page.wait_for_function('(id)=>document.querySelector(\'meta[name="web-hwp-build"]\')?.content===id', arg=build, timeout=15000)
                self.assertEqual(page.locator('#old-ui').count(), 0)
                self.assertEqual(page.locator('[contenteditable="true"]').first.inner_text(), '업데이트 전 작성한 문서')
                self.assertEqual(page.get_by_role('scrollbar', name='문서 세로 스크롤', exact=True).count(), 1)
                keys = page.evaluate('async()=>await caches.keys()')
                self.assertEqual(keys, ['web-hwp-shell-' + build])
                context.set_offline(True)
                page.reload()
                self.assertEqual(page.locator('meta[name="web-hwp-build"]').get_attribute('content'), build)
                self.assertEqual(page.locator('[contenteditable="true"]').first.inner_text(), '업데이트 전 작성한 문서')
                browser.close()
        finally:
            server.shutdown()
            server.server_close()


if __name__ == '__main__':
    unittest.main(verbosity=2)
