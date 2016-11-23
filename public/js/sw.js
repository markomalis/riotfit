var CACHE_PREFIX = 'riotfit-cache-';
var CACHE_VERSION = 'v0.4.3';

var CACHE_NAME = CACHE_PREFIX + CACHE_VERSION;

/*
var urlsToCache = [
  '/stylesheets/style.css',
  '/js/exercise.js'
];
*/

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      console.log('Cache opened successfully', cache);
    })
    .catch(function(error) {
      console.log('SW was not able to open cache', error);
    })
  );
});

self.addEventListener('activate', function(event) {
  event.waitUntil(
    caches.keys().then(function(cacheNames) {
      cacheNames.filter(function(cacheName) {
        return cacheName != CACHE_NAME;
      }).map(function(cacheName) {
        caches.delete(cacheName);
      });
    })
  );
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.open(CACHE_NAME).then(function(cache) {
      return fetch(event.request).then(function(response) {
        cache.put(event.request, response.clone());
        return response;
      })
      .catch(function(error) {
        return caches.match(event.request);
      })
    })
  );
});

self.addEventListener('push', function(event) {
  console.log('push message received', event);

  var data = event.data.json();
  var title  = 'Push message';

  event.waitUntil(
    self.registration.showNotification(title, {
      body: data.body,
      icon: 'images/favicon.png',
      tag: 'test-tag'
    })
  );
});

self.onmessage = function(e) {
  console.log(e);
}
