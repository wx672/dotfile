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
c.content.proxy = "socks://localhost:1080/"
c.content.webgl = True
c.downloads.location.directory = '/tmp/'
c.downloads.location.prompt = False
c.downloads.location.remember = False
c.downloads.location.suggestion = 'path'
c.downloads.open_dispatcher = None
c.downloads.position = 'top'
#c.editor.command = ["tmux", "new-window", "vim", "{}"]
c.editor.command = ["xterm", "-e", "vim", "{}"]
c.hints.auto_follow = 'always'
c.hints.auto_follow_timeout = 0
c.hints.border = "1px solid #CCCCCC"
c.hints.mode = "letter"
#c.hints.chars = "1234567890"
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
c.tabs.new_position.related = "last"
c.tabs.show = "switching"
c.tabs.show_switching_delay = 3000
c.tabs.title.format = "{title}"
c.url.default_page = 'https://duckduckgo.com'
c.url.open_base_url = True
c.url.start_pages = 'https://start.duckduckgo.com'
c.zoom.default = "175%"

# searches
c.url.searchengines = {
'DEFAULT':'https://duckduckgo.com/?q={}',
'g':'http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}',
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
config.bind('<Ctrl-/>', 'undo', mode='normal')
#config.unbind('o', mode='normal')
#config.unbind('O', mode='normal')
#config.bind('o', 'set-cmd-text -s :open -t', mode='normal')
#config.bind('O', 'set-cmd-text -s :open', mode='normal')
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
config.unbind('b', mode='normal')
config.bind('b', 'set-cmd-text -s :bookmark-add', mode='normal')
config.bind('<Shift-b>', 'open -t qute://bookmarks', mode='normal')

#config.bind('gi', 'enter-mode insert ;; jseval --quiet var inputs = document.getElementsByTagName("input"); for(var i = 0; i < inputs.length; i++) { var hidden = false; for(var j = 0; j < inputs[i].attributes.length; j++) { hidden = hidden || inputs[i].attributes[j].value.includes("hidden"); }; if(!hidden) { inputs[i].focus(); break; } }')
#config.bind('<Ctrl-p>', 'jseval document.location=\'https://pinboard.in/add?next=same&url=\'+encodeURIComponent(location.href)+\'&title=\'+encodeURIComponent(document.title)', mode="normal")

# config.set('content.proxy', 'none', '*://im.dingtalk.com/*')
# config.set('content.proxy', 'none', '*://wx2.qq.com/*')
# config.set('content.proxy', 'none', '*://cs2.swfu.edu.cn/*')
# config.set('content.proxy', 'none', '*://cs3.swfu.edu.cn/*')
# config.set('content.proxy', 'none', '*://cs6.swfu.edu.cn/*')
# config.set('content.proxy', 'none', '*://www.swfu.edu.cn/*')
# config.set('content.proxy', 'none', '*://jwc.swfu.edu.cn/*')

## colors
#c.colors.completion.fg = "#899CA1"
#c.colors.completion.category.fg = "#F2F2F2"
#c.colors.completion.category.bg = "#555555"
#c.colors.completion.item.selected.fg = "#FFFF00"
#c.colors.completion.item.selected.bg = "#333333"
#c.colors.completion.item.selected.border.top = "#333333"
#c.colors.completion.item.selected.border.bottom = "#333333"
#c.colors.completion.match.fg = "#F2F2F2"
##c.colors.statusbar.normal.fg = "#899CA1"
##c.colors.statusbar.normal.bg = "#222222"
#c.colors.statusbar.normal.fg = "black"
#c.colors.statusbar.normal.bg = "white"
##c.colors.statusbar.insert.fg = "#899CA1"
##c.colors.statusbar.insert.bg = "#222222"
#c.colors.statusbar.insert.fg = c.colors.statusbar.normal.fg
#c.colors.statusbar.insert.bg = c.colors.statusbar.normal.bg
#c.colors.statusbar.command.bg = "#555555"
#c.colors.statusbar.command.fg = "#F0F0F0"
#c.colors.statusbar.caret.bg = "#5E468C"
#c.colors.statusbar.caret.selection.fg = "white"
#c.colors.statusbar.progress.bg = "#333333"
#c.colors.statusbar.passthrough.bg = "#4779B3"
#c.colors.statusbar.url.fg = c.colors.statusbar.normal.fg
##c.colors.statusbar.url.success.http.fg = "#899CA1"
##c.colors.statusbar.url.success.https.fg = "#53A6A6"
#c.colors.statusbar.url.success.http.fg = c.colors.statusbar.normal.fg
#c.colors.statusbar.url.success.https.fg = c.colors.statusbar.normal.fg
#c.colors.statusbar.url.error.fg = "#8A2F58"
#c.colors.statusbar.url.warn.fg = "#914E89"
##c.colors.statusbar.url.hover.fg = "#2B7694"
#c.colors.statusbar.url.hover.fg = c.colors.statusbar.normal.fg
#c.colors.tabs.bar.bg = "#222222"
#c.colors.tabs.even.fg = "#899CA1"
#c.colors.tabs.even.bg = "#222222"
#c.colors.tabs.odd.fg = "#899CA1"
#c.colors.tabs.odd.bg = "#222222"
c.colors.tabs.selected.even.fg = "black"
c.colors.tabs.selected.even.bg = "yellow"
c.colors.tabs.selected.odd.fg = "black"
c.colors.tabs.selected.odd.bg = "yellow"
#c.colors.tabs.indicator.start = "#222222"
#c.colors.tabs.indicator.stop = "#222222"
#c.colors.tabs.indicator.error = "#8A2F58"
c.colors.hints.bg = "#CCCCCC"
#c.colors.hints.match.fg = "#000"
#c.colors.downloads.start.fg = "black"
#c.colors.downloads.start.bg = "#BFBFBF"
#c.colors.downloads.stop.fg = "black"
#c.colors.downloads.stop.bg = "#F0F0F0"
#c.colors.keyhint.fg = "#FFFFFF"
#c.colors.keyhint.suffix.fg = "#FFFF00"
#c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"
#c.colors.messages.error.bg = "#8A2F58"
#c.colors.messages.error.border = "#8A2F58"
#c.colors.messages.warning.bg = "#BF85CC"
#c.colors.messages.warning.border = c.colors.messages.warning.bg
#c.colors.messages.info.bg = "#333333"
#c.colors.prompts.fg = "#333333"
#c.colors.prompts.bg = "#DDDDDD"
#c.colors.prompts.selected.bg = "#4779B3"

# fonts
c.fonts.tabs = "14pt Noto Sans Mono"
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


