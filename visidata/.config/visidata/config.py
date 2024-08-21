TableSheet.unbindkey('Ctrl+P')
TableSheet.unbindkey('Ctrl+N')
TableSheet.bindkey('Ctrl+P', 'jump-prev')
TableSheet.bindkey('Ctrl+N', 'jump-first')
TableSheet.unbindkey('i')
TableSheet.unbindkey('x')
TableSheet.bindkey('i', 'edit-cell')
TableSheet.bindkey('x', 'cut-cell')
TableSheet.unbindkey('d')
TableSheet.bindkey('d', 'cut-row')
TableSheet.unbindkey('a')
TableSheet.bindkey('a','addcol-incr')
TableSheet.bindkey('0', 'go-leftmost')
options.disp_menu=False
options.disp_sidebar=False
options.motd_url=''
options.quitguard=True
options.color_current_cell="bold yellow"
