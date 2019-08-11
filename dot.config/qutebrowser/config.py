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
c.content.host_blocking.enabled = False
c.content.javascript.can_access_clipboard = True
c.content.javascript.can_open_tabs_automatically = True
#c.content.javascript.can_close_tabs = True
c.content.javascript.log = {'unknown': 'none', 'info': 'none', 'warning': 'none', 'error': 'none'}
c.content.plugins = True
c.content.proxy = "socks://localhost:1080/"
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
#c.input.insert_mode.auto_load = True
c.input.partial_timeout = 2000
c.keyhint.blacklist = ["*"]
c.messages.timeout = 5000
c.new_instance_open_target = "tab"
c.prompt.filebrowser = False
c.scrolling.smooth = False
c.session.default_name = None
c.session.lazy_restore = True
c.statusbar.hide = True
c.tabs.background = False
c.tabs.favicons.show = "never"
c.tabs.last_close = "close"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 3000
#c.tabs.title.format = "{title}"
c.url.default_page = 'https://google.com'
#c.url.default_page = 'https://duckduckgo.com'
c.url.open_base_url = True
#c.url.start_pages = 'https://start.duckduckgo.com'
c.url.start_pages = 'https://google.com'
c.zoom.default = "175%"
c.zoom.levels = ["75%","100%","125%","150%","175%","200%","225%","250%","275%","300%","400%","500%"]

# searches
c.url.searchengines = {
'DEFAULT':'http://www.google.com/search?q={}',
'ddg':'https://duckduckgo.com/?q={}',
'w':'https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search={}',
'y':'https://www.youtube.com/results?search_query={}',
'gh':'https://github.com/search?q={}&type=Code'
}

# aliases
c.aliases = {
'gd':'open -t https://im.dingtalk.com',
'gl':'open -t http://cs2.swfu.edu.cn/~wx672/lecture_notes',
'gm':'open -t https://mail.google.com',
'gw':'open -t https://wx2.qq.com/?lang=en',
'gy':'open -t https://youtube.com'
}

# keybinds
config.bind('<Escape>', 'leave-mode', mode='passthrough')
config.unbind('<Ctrl-v>', mode='normal')
config.bind('<Ctrl-i>', 'enter-mode passthrough', mode='normal')
config.bind('<Ctrl-/>', 'undo', mode='normal')
config.unbind('ga', mode='normal')
config.unbind('<Ctrl-Tab>', mode='normal')
config.bind('<Ctrl-Tab>', 'tab-next', mode='normal')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev', mode='normal')
config.unbind('=', mode='normal')
config.bind('=', 'zoom-in', mode='normal')
config.unbind('d', mode='normal')
config.unbind('u', mode='normal')
config.bind('d','scroll-page 0 0.5', mode='normal')
config.bind('u','scroll-page 0 -0.5', mode='normal')
config.bind('<Backspace>','scroll-page 0 -1', mode='normal')
config.bind('<Ctrl-Shift-r>', 'restart', mode='normal')
config.bind('<Ctrl-r>', 'reload', mode='normal')
config.unbind('r', mode='normal')
config.bind('<Ctrl-Shift-Right>', 'tab-move +', mode='normal')
config.bind('<Ctrl-Shift-Left>', 'tab-move -', mode='normal')
config.unbind('<Ctrl-a>', mode='normal')
config.bind('<Ctrl-a><Ctrl-s>', 'config-cycle content.proxy none socks://localhost:1080', mode='normal')
config.bind('<Ctrl-a><Ctrl-p>', 'config-cycle content.pdfjs True False', mode='normal')
config.bind('<Ctrl-a><Ctrl-t>', 'config-cycle statusbar.hide ;; config-cycle tabs.show multiple never')
config.unbind('b', mode='normal')
config.bind('b', 'set-cmd-text -s :bookmark-add', mode='normal')
config.bind('<Shift-b>', 'open -t qute://bookmarks', mode='normal')

#config.bind('gi', 'enter-mode insert ;; jseval --quiet var inputs = document.getElementsByTagName("input"); for(var i = 0; i < inputs.length; i++) { var hidden = false; for(var j = 0; j < inputs[i].attributes.length; j++) { hidden = hidden || inputs[i].attributes[j].value.includes("hidden"); }; if(!hidden) { inputs[i].focus(); break; } }')
#config.bind('<Ctrl-p>', 'jseval document.location=\'https://pinboard.in/add?next=same&url=\'+encodeURIComponent(location.href)+\'&title=\'+encodeURIComponent(document.title)', mode="normal")

## colors
c.colors.tabs.selected.even.fg = "black"
c.colors.tabs.selected.even.bg = "yellow"
c.colors.tabs.selected.odd.fg = "black"
c.colors.tabs.selected.odd.bg = "yellow"
c.colors.hints.bg = "#CCCCCC"

# fonts
c.fonts.tabs = "14pt NotoMono Nerd Font"
c.fonts.statusbar = "16pt NotoMono Nerd Font"
c.fonts.downloads = c.fonts.statusbar 
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "20pt NotoMono Nerd Font"
c.fonts.messages.info = "20pt NotoMono Nerd Font"
c.fonts.keyhint = c.fonts.hints
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar
c.fonts.monospace = '"DejaVuSansMono Nerd Font", "NotoMono Nerd Font", Monospace, "Liberation Mono", monospace'
