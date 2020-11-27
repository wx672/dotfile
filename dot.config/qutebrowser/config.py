# ---------------------------------------------------
# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=python:
# ---------------------------------------------------

# general settings
c.auto_save.session = True
c.completion.height = "30%"
c.completion.web_history.max_items = 1000
c.content.cache.size = 52428800
c.content.default_encoding = 'utf-8'
c.content.blocking.enabled = True
c.content.javascript.can_access_clipboard = True
c.content.javascript.can_open_tabs_automatically = True
#.content.javascript.can_close_tabs = True
c.content.javascript.log = {'unknown': 'none', 'info': 'none', 'warning': 'none', 'error': 'none'}
c.content.plugins = True
c.content.proxy = "socks://localhost:1080/"
c.content.user_stylesheets = ["null.css", "solarized-light-all-sites.css", "solarized-light-generic.css", "solarized-light-mediawiki.org.css", "solarized-light-github.css", "solarized-light-google.com.css", "solarized-light-stackexchange.com.css", "solarized-light-reddit.com.css"]
#.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML like Gecko) Firefox/68.0'
c.content.webgl = True
c.downloads.location.directory = '/tmp/'
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.location.suggestion = 'path'
c.downloads.open_dispatcher = None
c.downloads.position = 'top'
c.editor.command = ["xterm", "-e", "vim", "{}"]
c.hints.auto_follow = 'always'
c.hints.auto_follow_timeout = 0
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "letter"
#.input.insert_mode.auto_load = True
c.input.partial_timeout = 2000
c.keyhint.blacklist = ["*"]
c.messages.timeout = 5000
c.new_instance_open_target = "tab"
c.prompt.filebrowser = False
c.scrolling.smooth = False
c.session.default_name = None
c.session.lazy_restore = True
c.statusbar.show = "never"
c.tabs.background = False
c.tabs.favicons.show = "never"
c.tabs.last_close = "close"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 3000
#.tabs.title.format = "{title}"
c.url.default_page = 'https://google.com'
#.url.default_page = 'https://duckduckgo.com'
c.url.open_base_url = True
#.url.start_pages = 'https://start.duckduckgo.com'
c.url.start_pages = 'https://google.com'
c.zoom.default = "200%"
c.zoom.levels = ["75%","100%","125%","150%","175%","200%","225%","250%","275%","300%","400%","500%"]

# searches
# example: :open ddg wx672
c.url.searchengines = {
'DEFAULT':'http://www.google.com/search?q={}',
'ddg':'https://duckduckgo.com/?q={}',
'w':'https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}',
'y':'https://www.youtube.com/results?search_query={}',
'gh':'https://github.com/search?q={}&type=Code'
}

# aliases
# example: :ding
c.aliases = {
'ding':'open -t https://im.dingtalk.com',
'gist':'open -t https://gist.github.com',
'github':'open -t https://github.com',
'gmail':'open -t https://mail.google.com',
'lec':'open -t https://cs6.swfu.edu.cn/~wx672/lecture_notes',
'wechat':'open -t https://wx2.qq.com/',
'youtube':'open -t https://youtube.com'
}

# keybinds
# config.unbind('F', mode='normal')
# config.unbind('f', mode='normal')
# config.bind('f', 'hint all tab', mode='normal')
# config.bind('F', 'hint', mode='normal')
config.unbind('<Ctrl-q>', mode='normal')
config.unbind('<Ctrl-v>', mode='normal')
config.unbind('<Ctrl-a>', mode='normal')
config.unbind('ga', mode='normal')
config.unbind('r', mode='normal')
config.bind('<Escape>', 'leave-mode', mode='passthrough')
config.bind('<Ctrl-i>', 'enter-mode passthrough', mode='normal')
config.bind('<Ctrl-/>', 'undo', mode='normal')
config.unbind('<Ctrl-Tab>', mode='normal')
config.bind('<Ctrl-Tab>', 'tab-next', mode='normal')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev', mode='normal')
config.unbind('=', mode='normal')
config.bind('=', 'zoom-in', mode='normal')
config.unbind('d', mode='normal')
config.bind('d','scroll-page 0 0.5', mode='normal')
config.unbind('u', mode='normal')
config.bind('u','scroll-page 0 -0.5', mode='normal')
config.bind('<Backspace>','scroll-page 0 -1', mode='normal')
config.bind('<Ctrl-Shift-r>', 'restart', mode='normal')
config.bind('<Ctrl-r>', 'reload', mode='normal')
config.bind('<Ctrl-Shift-Right>', 'tab-move +', mode='normal')
config.bind('<Ctrl-Shift-Left>', 'tab-move -', mode='normal')
config.bind('<Ctrl-a><Ctrl-p>', 'config-cycle content.pdfjs True False', mode='normal')
config.bind('<Ctrl-a><Ctrl-r>', 'config-cycle content.user_stylesheets solarized-light-all-sites.css solarized-light-generic.css solarized-light-github.css solarized-light-google.com.css solarized-light-mediawiki.org.css solarized-light-stackexchange.com.css solarized-light-reddit.com.css', mode='normal')
config.bind('<Ctrl-a><Ctrl-s>', 'config-cycle content.proxy none socks://localhost:1080 socks://127.0.0.1:7891', mode='normal')
config.bind('<Shift-i>', 'config-cycle statusbar.show never always;; config-cycle tabs.show multiple never')
config.unbind('b', mode='normal')
config.bind('b', 'set-cmd-text -s :bookmark-add', mode='normal')
config.bind('<Shift-b>', 'open -t qute://bookmarks', mode='normal')
config.bind('<Ctrl-a>i', 'spawn --userscript password_fill', mode='normal')

config.bind(';d', 'hint links spawn aria2c --no-conf --check-certificate=false -x6 {hint-url}')

config.bind('gi', 'enter-mode insert ;; jseval --quiet var inputs = document.getElementsByTagName("input"); for(var i = 0; i < inputs.length; i++) { var hidden = false; for(var j = 0; j < inputs[i].attributes.length; j++) { hidden = hidden || inputs[i].attributes[j].value.includes("hidden"); }; if(!hidden) { inputs[i].focus(); break; } }')

config.bind('gs', 'jseval document.location=\'https://gist.github.com\'', mode="normal")
config.bind('cs6m', 'jseval document.location=\'https://cs6.swfu.edu.cn/moodle\'', mode="normal")

#config.bind('gp', 'jseval document.location=\'https://pinboard.in/add?next=same&url=\'+encodeURIComponent(location.href)+\'&title=\'+encodeURIComponent(document.title)', mode="normal")

## colors
c.colors.tabs.even.fg = "white"
c.colors.tabs.even.bg = "black"
c.colors.tabs.odd.fg = "white"
c.colors.tabs.odd.bg = "black"
c.colors.tabs.selected.even.fg = "black"
c.colors.tabs.selected.even.bg = "yellow"
c.colors.tabs.selected.odd.fg = "black"
c.colors.tabs.selected.odd.bg = "yellow"
c.colors.tabs.pinned.even.fg = "white"
c.colors.tabs.pinned.even.bg = "black"
c.colors.tabs.pinned.odd.fg = "white"
c.colors.tabs.pinned.odd.bg = "black"
c.colors.tabs.pinned.selected.even.fg = "black"
c.colors.tabs.pinned.selected.even.bg = "yellow"
c.colors.tabs.pinned.selected.odd.fg = "black"
c.colors.tabs.pinned.selected.odd.bg = "yellow"
c.colors.hints.bg = "#cccccc"
c.colors.webpage.bg = "#eeeeee"

# fonts
c.fonts.tabs.selected = "14pt Noto Sans Mono"
c.fonts.tabs.unselected = "14pt Noto Sans Mono"
c.fonts.statusbar = "16pt Noto Sans Mono"
c.fonts.downloads = c.fonts.statusbar 
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "20pt Noto Sans Mono"
c.fonts.messages.info = "20pt Noto Sans Mono"
c.fonts.keyhint = c.fonts.hints
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar

config.load_autoconfig(False)
