'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "18b2bc92db48665f7d2a55e058af8c72",
"assets/AssetManifest.bin.json": "dd23d5c6a099b27f356daf44a5306fe5",
"assets/AssetManifest.json": "9fd3d03599ede415793609871292cc60",
"assets/assets/fonts/CalligraphyFLF.ttf": "0326b724eba54da3e8184afb51a51aed",
"assets/assets/fonts/charlotte.ttf": "8d6e47685a9f9363d62eb85c8c30f2d4",
"assets/assets/fonts/EduAUVICWANTPre-VariableFont_wght.ttf": "5eda1a878475f5bddb26653888d0b34b",
"assets/assets/images/edukid_sample/Edukid%25201.png": "471527869d940cf7de9198df10fae759",
"assets/assets/images/edukid_sample/Edukid%25203.png": "3e3c10d074c222cfb0b5e5da9a22a5a0",
"assets/assets/images/edukid_sample/Edukid%25204.png": "44a7c959172752f0898a1a23b811708e",
"assets/assets/images/edukid_sample/Edukid%25206.png": "907ac6f8ecea826129006a17b4b45b25",
"assets/assets/images/edukid_sample/Edukid%25207.png": "f57fb31238c8c5470cd774a7837ddd27",
"assets/assets/images/edukid_sample/Edukid%25208.png": "958baeae0743b8927e349c07c5708d15",
"assets/assets/images/edukid_sample/Edukid.png": "6b644816a45f2ffd67e8448e92b5d371",
"assets/assets/images/Picture_web.png": "fd1d1d31d74527f045f9472b3da8ea74",
"assets/assets/images/timekeeper_sample/Timekeeper%252010.jpeg": "0c9cce05dedb20ab0e203d4cbaf47ebb",
"assets/assets/images/timekeeper_sample/Timekeeper%25203.png": "ac263e96aa5d5fd4a01c7dea8e9facae",
"assets/assets/images/timekeeper_sample/Timekeeper%25205.png": "41b10b15157f8a69ec8ea543de80869b",
"assets/assets/images/timekeeper_sample/Timekeeper%25206.png": "90b53aad9add874edf6be4afb7482948",
"assets/assets/images/timekeeper_sample/Timekeeper%25208.jpeg": "89f12259fe550d8063611302ed742451",
"assets/assets/images/timekeeper_sample/Timekeeper%25209.jpeg": "210e0802fa3496ec6cee5bab3e6ea64b",
"assets/assets/images/timekeeper_sample/Timekeeper.png": "66ead8d4bfdeef158e8ab3af49040795",
"assets/assets/images/Web_Picture-transformed.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/Web_picture.png": "695d5187de793bb23bd67f932de9952a",
"assets/FontManifest.json": "449591a962cde3f7f82866219baa3f62",
"assets/fonts/MaterialIcons-Regular.otf": "7c28c5886b43014f947103f25ed8a373",
"assets/NOTICES": "f4dcc187ae08d275c5fab8c568e2c5b0",
"assets/packages/awesome_snackbar_content/assets/back.svg": "ba1c3aebba280f23f5509bd42dab958d",
"assets/packages/awesome_snackbar_content/assets/bubbles.svg": "1df6817bf509ee4e615fe821bc6dabd9",
"assets/packages/awesome_snackbar_content/assets/types/failure.svg": "cb9e759ee55687836e9c1f20480dd9c8",
"assets/packages/awesome_snackbar_content/assets/types/help.svg": "7fb350b5c30bde7deeb3160f591461ff",
"assets/packages/awesome_snackbar_content/assets/types/success.svg": "6e273a8f41cd45839b2e3a36747189ac",
"assets/packages/awesome_snackbar_content/assets/types/warning.svg": "cfcc5fcb570129febe890f2e117615e0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "9def47fb22868073f86040166d4bd66c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "bf21cd8fd775a3c59fd53afdee39e0e6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "db24a0c2f1f5cbf5ce2a968507855314",
"icons/android-chrome-192x192.png": "d8c6c056a23cd12b01d2cc890e3f8aab",
"icons/android-chrome-512x512.png": "6be4ca7cdcd76356d19c2be7658bc878",
"icons/apple-touch-icon.png": "fa6c09c35b00c8a2e957d947ce26d909",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2a5c5688de96d7a37f6b7237f4da9562",
"/": "2a5c5688de96d7a37f6b7237f4da9562",
"logo.png": "d8c6c056a23cd12b01d2cc890e3f8aab",
"main.dart.js": "06423776104a8f45e15f4fa72c7c904a",
"manifest.json": "b7f4a761e0d0c7c9cc75b26984d2687b",
"version.json": "ab4d6327ae11f1d6b42ac92e7e0f3342"};
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
