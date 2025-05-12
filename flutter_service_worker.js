'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "7609ec49f22fe250ec6b1b8171ec73ae",
"/": "7609ec49f22fe250ec6b1b8171ec73ae",
"manifest.json": "fccb5d33d96152be35c706656b53bbfb",
"main.dart.js": "1ccd438730b6a2d396267ef843ad8c2a",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"flutter_bootstrap.js": "5337271e9958b4a062277a3f710f4e2d",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "80137225cae0f19e3c5ba16e4af5ab8e",
"assets/AssetManifest.bin": "7d3f0afb2dcad246cf2a465e5209a5f5",
"assets/AssetManifest.bin.json": "ef95df0ed7b2e0e5f547fd4841539e84",
"assets/NOTICES": "264f88b1a36c0ab06bf66b65e047c2e9",
"assets/assets/duck_1.jpg": "18775ebbc8af86824da612fce019a79e",
"assets/assets/frog_0.png": "b88936f816a684f78bb628686d22ef46",
"assets/assets/turtle_icon_small.png": "f5663904557f69d7c4e5d5226c971fc1",
"assets/assets/duck_3.jpg": "b0ee248c158501ddbb875f33bc34b403",
"assets/assets/duck_5.jpg": "94a4d2f03223e769240db037ff8c9fae",
"assets/assets/logo_homepage_2.png": "fe01cc71dd09e8c3088716096eefe658",
"assets/assets/loveletter_ver1_title.png": "9cadd914364e18e6bfcef46b575633e2",
"assets/assets/card4.png": "cc7ad975044d5c3599316d7f948ffb24",
"assets/assets/card3.png": "e14c3732a3b70c950f1425728d8f5ea9",
"assets/assets/card2.png": "737e9084feed951623061ef4e4e83f19",
"assets/assets/frog_3.png": "2ae6a3b7c82bb14e107edffbffebca1e",
"assets/assets/frog_title.jpg": "cb6401c8e302944f4045a891471832ab",
"assets/assets/clips/ll_4.mp4": "dfd10ff00f98063ca7b14d3ce617c76d",
"assets/assets/clips/ll_6.mp4": "c8485ba257fea5321066c2aa65af8d5d",
"assets/assets/clips/ll_5.mp4": "d62c3b82d1e8e63751e4f9f7e743db3a",
"assets/assets/clips/take_heart.mp4": "9e233281dc5fcd04c27ddd41520daca4",
"assets/assets/clips/give_gift.mp4": "3ff4331ea97393714b07a3a0ad5fddc0",
"assets/assets/clips/ll_7.mp4": "0d61e3a0a38c38f7cb66ffa9408a3d94",
"assets/assets/clips/test_1.mp4": "9efce30b5c3067957722b3d1deb040a3",
"assets/assets/clips/give_heart.mp4": "1190a2c6a0a597407e8c950e46520c35",
"assets/assets/clips/ll_2.mp4": "241753ad32e1077ca585d61a4a4f2ad4",
"assets/assets/clips/ll_3.mp4": "3e11d3f22960919cdb5e72743be988d7",
"assets/assets/clips/ll_1.mp4": "07d28206fb2cfc9f3d3a2d19406d9828",
"assets/assets/duck_4.jpg": "310d86d23ac69a4645a91e18b4fb24d9",
"assets/assets/modu.jpg": "16070bd8bd8a54f3055f066334955320",
"assets/assets/test.mp4": "1e6b65f4e4b467b0b77faa79a1ad0284",
"assets/assets/duck_6.jpg": "7a3d933a25fa41f743d198e0770d0ce0",
"assets/assets/loveletter_ver1.png": "3ba4abda36ada651136353c8f4b6b77c",
"assets/assets/frog_2.png": "827b498583e5eec044a559e3ff388f20",
"assets/assets/card5.png": "feaac63bfcab6ded87f5347af4316421",
"assets/assets/duck_shower_logo.png": "d62038989d758103b9190abdbaeddc93",
"assets/assets/duck_2.jpg": "7b9a9ec0745b3e1300ba56871f6527a9",
"assets/assets/frog_1.png": "809b5e5c635e44b2522ff7ef8018c60c",
"assets/assets/card1.png": "64f8fbef5800a1bde93be395660bd5e7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "e93a662d3a8739c85d3656f8b2e29b92",
"version.json": "d3ecc52db3ac2bfb8a0b3c0107f86973"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
