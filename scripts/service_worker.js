/* Generated with the hash of the final, bundled HTML (not Vite's intermediate HTML). */
const BUILD = '__BUILD_ID__';
const CACHE = 'web-hwp-shell-' + BUILD;
const INDEX = new URL('index.html', self.registration.scope).href;
self.addEventListener('install', event => {
  event.waitUntil((async () => {
    const response = await fetch(INDEX, { cache: 'no-store' });
    if (!response.ok) throw new Error('Unable to cache Web HWP shell: ' + response.status);
    const cache = await caches.open(CACHE);
    await cache.put(INDEX, response);
    await self.skipWaiting();
  })());
});
self.addEventListener('activate', event => {
  event.waitUntil((async () => {
    const priorCaches = await caches.keys();
    await Promise.all(priorCaches.filter(key => key !== CACHE &&
      (key.startsWith('web-hwp-shell-') || key.startsWith('workbox-precache-'))).map(key => caches.delete(key)));
    await self.clients.claim();
    // Older installed pages have no update listener. Replace their stale shell once,
    // while preserving the app's localStorage document and all browser storage.
    if (priorCaches.some(key => key !== CACHE && (key.startsWith('web-hwp-shell-') || key.startsWith('workbox-precache-')))) {
      const clients = await self.clients.matchAll({ type: 'window', includeUncontrolled: true });
      // Do not await navigation inside activate: its fetch waits for activation,
      // so awaiting both creates a deadlock for an already-installed app.
      for (const client of clients.filter(client => client.url.startsWith(self.registration.scope))) {
        client.navigate(client.url).catch(() => {});
      }
    }
  })());
});
self.addEventListener('fetch', event => {
  if (event.request.mode !== 'navigate' || new URL(event.request.url).origin !== self.location.origin) return;
  event.respondWith((async () => {
    try {
      const response = await fetch(event.request, { cache: 'no-store' });
      if (!response.ok) throw new Error('HTTP ' + response.status);
      const cache = await caches.open(CACHE);
      await cache.put(INDEX, response.clone());
      return response;
    } catch (error) {
      const saved = await caches.match(INDEX, { cacheName: CACHE });
      if (saved) return saved;
      throw error;
    }
  })());
});
