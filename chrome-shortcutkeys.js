// ==UserScript==
// @ShortcutManager
// @name Read Now
// @namespace 3u666ZvnH9XK
// @key Alt+v
// @include *
// ==/UserScript==
javascript:(%0A%28function%28%29%7Bwindow.baseUrl%3D%27//www.readability.com%27%3Bwindow.readabilityToken%3D%27%27%3Bvar%20s%3Ddocument.createElement%28%27script%27%29%3Bs.setAttribute%28%27type%27%2C%27text/javascript%27%29%3Bs.setAttribute%28%27charset%27%2C%27UTF-8%27%29%3Bs.setAttribute%28%27src%27%2CbaseUrl%2B%27/bookmarklet/read.js%27%29%3Bdocument.documentElement.appendChild%28s%29%3B%7D%29%28%29)

// ==UserScript==
// @ShortcutManager
// @name Open "Readability topread" in a new tab
// @namespace 3u666ZvnH9XK
// @key Alt+r
// @include *
// @execute OpenAPage(["https://www.readability.com/topreads/"])
// ==/UserScript==

// ==UserScript==
// @ShortcutManager
// @name Open ShortcutManager
// @namespace 3u666ZvnH9XK
// @key Alt+k
// @include *
// @execute OpenOptionHtml([])
// ==/UserScript==

// ==UserScript==
// @ShortcutManager
// @name Open Extension
// @namespace 3u666ZvnH9XK
// @key Alt+e
// @include *
// @execute OpenExtension([])
// ==/UserScript==
