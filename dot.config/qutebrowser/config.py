# file:     $XDG_CONFIG_HOME/qutebrowser/config.py
# vim:fenc=utf-8:nu:ai:si:et:ts=4:sw=4:ft=python:
# ---------------------------------------------------

import subprocess
import os
from qutebrowser.api import interceptor

# general settings
c.auto_save.session = True
c.changelog_after_upgrade = 'never'
c.completion.height = "30%"
c.completion.web_history.max_items = 1000
c.content.cache.size = 52428800
c.content.default_encoding = 'utf-8'
c.content.blocking.enabled = True
c.content.fullscreen.overlay_timeout = 0
c.content.fullscreen.window = True
c.content.javascript.can_access_clipboard = True
c.content.javascript.can_open_tabs_automatically = True
c.content.javascript.log = {'unknown': 'none', 'info': 'none', 'warning': 'none', 'error': 'none'}
c.content.plugins = True
c.content.proxy = "socks://localhost:7891"
c.content.webgl = True
c.downloads.location.directory = '/tmp/'
c.downloads.location.prompt = True
c.downloads.location.remember = False
c.downloads.location.suggestion = 'path'
c.downloads.open_dispatcher = None
c.downloads.position = 'top'
c.editor.command = ["emacsclient", "-c", "{}"]
c.fileselect.folder.command = ["st", "-e", "sh", "-c", "lf -selection-path {}"]
c.fileselect.multiple_files.command = c.fileselect.folder.command
c.fileselect.single_file.command = c.fileselect.folder.command
c.fileselect.handler = "external"
c.hints.auto_follow = 'always'
c.hints.auto_follow_timeout = 0
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "letter"
c.input.insert_mode.auto_load = True
c.input.insert_mode.leave_on_load = True
c.input.partial_timeout = 2000
c.keyhint.blacklist = ["*"]
c.messages.timeout = 5000
c.new_instance_open_target = "tab"
c.prompt.filebrowser = False
c.scrolling.smooth = False
c.session.default_name = None
c.session.lazy_restore = True
c.statusbar.show = "always"
c.tabs.background = False
c.tabs.favicons.show = "always"
c.tabs.last_close = "close"
c.tabs.show = "always"
c.tabs.show_switching_delay = 3000
c.url.default_page = 'https://google.com'
c.url.open_base_url = True
c.url.start_pages = 'https://google.com'
c.zoom.default = "150%"
c.zoom.levels = ["100%","125%","150%","175%","200%","225%","250%","275%","300%"]

# searches
# example: :open d hello
c.url.searchengines = {
    'DEFAULT':'http://www.google.com/search?q={}',
    'a':'https://wiki.archlinux.org/?search={}',
    'b':'https://search.bilibili.com/all?keyword={}',
    'd':'https://duckduckgo.com/?q={}',
    'e':'https://earth.google.com/web/search/{}',
    'en':'https://ludwig.guru/s/{}',
    'gh':'https://github.com/search?q={}',
    'jd':'https://search.jd.com/Search?keyword={}',
    'l':'https://www.latexstudio.net/index/lists/barSearch/text/{}',
    'p':'http://thepiratebay.org/search/{}',
    'pb':'https://pirate-bays.net/search?q={}',
    'r':'https://reddit.com/r/{}',
    's':'https://stackexchange.com/search?q={}',
    'w':'https://en.wikipedia.org/?search={}',
    'x':'https://www.1337xx.to/search/{}/1/',
    'xda':'https://www.xda-developers.com/search/?query={}',
    'ximalaya':'https://www.ximalaya.com/search/{}',
    'y':'https://www.youtube.com/results?search_query={}',
}

## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
c.aliases = {
    'proxy':'set content.proxy',
    'calibre':'open -t https://cs6.swfu.edu.cn/calibre',
    'cs6':'open -t https://cs6.swfu.edu.cn/moodle',
    'cs6lecture':'open -t https://cs6.swfu.edu.cn/~wx672/lecture_notes',
    'ding':'open -t https://im.dingtalk.com',
    'gist':'open -t https://gist.github.com',
    'gmail':'open -t https://mail.google.com',
    'lecture':'open -t https://cs6.swfu.edu.cn/~wx672/lecture_notes',
    'wechat':'open -t https://web.wechat.com/',
    'havoc':'https://havoc-os.com/download'
}

# keybinds
# config.unbind('F', mode='normal')
# config.unbind('f', mode='normal')
# config.bind('f', 'hint all tab', mode='normal')
# config.bind('F', 'hint', mode='normal')
config.unbind('<F11>', mode='normal')
config.unbind('<Ctrl-n>', mode='normal')
config.unbind('<Ctrl-p>', mode='normal')
config.unbind('<Ctrl-q>', mode='normal')
config.unbind('<Ctrl-v>', mode='normal')
config.unbind('<Ctrl-a>', mode='normal')
config.unbind('ga', mode='normal')
config.unbind('r', mode='normal')
config.bind('<Ctrl-Shift-p>', 'tab-pin', mode='normal')
config.bind('<Escape>', 'mode-leave', mode='passthrough')
config.bind('<Ctrl-i>', 'mode-enter passthrough', mode='normal')
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
config.bind('<Ctrl-a><Ctrl-s>', 'config-cycle content.proxy socks://localhost:7891 socks://127.0.0.1:1080 none', mode='normal')
config.bind('<Shift-i>', 'config-cycle statusbar.show never always;; config-cycle tabs.show never always')
config.unbind('b', mode='normal')
config.bind('<Shift-b>', 'open -t qute://bookmarks', mode='normal')
config.bind(';d', 'hint links spawn aria2c --no-conf --check-certificate=false -x6 {hint-url}')
config.bind(';a', 'hint links spawn -u clipappend {hint-url}')
config.bind('rr', 'spawn -u readability')
config.unbind('pp', mode='normal')
config.bind('pp', 'spawn -u qute-pass --password-only')

config.bind('gi', 'mode-enter insert ;; jseval --quiet var inputs = document.getElementsByTagName("input"); for(var i = 0; i < inputs.length; i++) { var hidden = false; for(var j = 0; j < inputs[i].attributes.length; j++) { hidden = hidden || inputs[i].attributes[j].value.includes("hidden"); }; if(!hidden) { inputs[i].focus(); break; } }')

## Readline Insert Mode
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
config.bind("<Ctrl-y>", "insert-text {primary}", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-x><Ctrl-e>", "edit-text", "insert")

## Readline Insert Mode
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
config.bind("<Ctrl-y>", "insert-text {primary}", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")

## colors
c.colors.tabs.even.fg                 = "white"
c.colors.tabs.even.bg                 = "black"
c.colors.tabs.odd.fg                  = "white"
c.colors.tabs.odd.bg                  = "black"
c.colors.tabs.selected.even.fg        = "black"
c.colors.tabs.selected.even.bg        = "yellow"
c.colors.tabs.selected.odd.fg         = "black"
c.colors.tabs.selected.odd.bg         = "yellow"
c.colors.tabs.pinned.even.fg          = "white"
c.colors.tabs.pinned.even.bg          = "black"
c.colors.tabs.pinned.odd.fg           = "white"
c.colors.tabs.pinned.odd.bg           = "black"
c.colors.tabs.pinned.selected.even.fg = "black"
c.colors.tabs.pinned.selected.even.bg = "yellow"
c.colors.tabs.pinned.selected.odd.fg  = "black"
c.colors.tabs.pinned.selected.odd.bg  = "yellow"
c.colors.hints.bg                     = "#cccccc"
c.colors.webpage.bg                   = "#eeeeee"

# fonts
c.fonts.default_family      = ["Noto Sans Mono"]
c.fonts.default_size        = '22pt'
c.fonts.statusbar           = "default_size default_family"
c.fonts.tabs.selected       = "default_size default_family"
c.fonts.tabs.unselected     = "default_size default_family"
c.fonts.downloads           = "default_size default_family"
c.fonts.prompts             = "default_size default_family"
c.fonts.hints               = "default_size default_family"
c.fonts.messages.info       = "default_size default_family"
c.fonts.keyhint             = "bold default_size default_family"
c.fonts.messages.warning    = "default_size default_family"
c.fonts.messages.error      = "default_size default_family"
c.fonts.completion.entry    = "default_size default_family"
c.fonts.completion.category = "default_size default_family"
c.fonts.web.size.default    = 22
c.fonts.web.size.default_fixed = 20


## Don't load settings done via the GUI.
config.load_autoconfig(False)
