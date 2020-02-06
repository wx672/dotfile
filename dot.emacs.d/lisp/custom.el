(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#FDF6E3"])
 '(blink-cursor-mode nil)
 '(bookmark-save-flag 1)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program (executable-find "x-www-browser"))
 '(cal-tex-24 t)
 '(case-fold-search t)
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(confirm-kill-emacs nil)
 '(cua-auto-tabify-rectangles nil)
 '(cua-selection-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (material-light)))
 '(custom-safe-themes
   (quote
	("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(debug-on-error nil)
 '(default-major-mode (quote org-mode) t)
 '(dired-guess-shell-alist-user nil)
 '(dired-omit-extensions
   (quote
	("~" ".bin" ".lbin" ".a" ".ln" ".blg" ".bcf" ".run.xml" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".snm" ".out" ".nav" ".out" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyg" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs")))
 '(dired-omit-files-p t t)
 '(dired-omit-mode t t)
 '(dired-recursive-copies t)
 '(dired-recursive-deletes t)
 '(display-battery-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-format nil)
 '(display-time-mode t nil (time))
 '(display-time-use-mail-icon t)
 '(doc-view-continuous nil)
 '(fci-rule-color "#383838")
 '(fill-column 90)
 '(fringe-mode (quote (1 . 1)) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-hl-line-mode t nil (hl-line))
 '(graphviz-dot-auto-indent-on-semi nil)
 '(helm-full-frame t)
 '(hi-lock-mode t t (hi-lock))
 '(inhibit-startup-screen t)
 '(ispell-extra-args (quote ("--reverse")))
 '(ispell-local-dictionary "en_US")
 '(linum-format "%d ")
 '(magit-auto-revert-mode nil)
 '(make-backup-files nil)
 '(mark-diary-entries-in-calendar t)
 '(menu-bar-mode nil)
 '(mode-line-in-non-selected-windows t)
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Documents/No.14/accounting.org")))
 '(org-ditaa-jar-path "/usr/bin/ditaa")
 '(org-time-stamp-custom-formats (quote ("<%m/%d/%y>" . "<%m/%d/%y>")))
 '(package-selected-packages
   (quote
	(helm-unicode elpy markdown-mode magit outline-magic yasnippet-classic-snippets material-theme graphviz-dot-mode nov csv-nav wgrep-ag nasm-mode web-mode yasnippet-snippets async helm auctex diminish helm-config helm-command helm-files ascii-art-to-unicode pyim yatemplate sicp org-pdfview org-chinese-utils htmlize helm-gtags helm-c-yasnippet helm-ag exec-path-from-shell csv-mode cider-eval-sexp-fu use-package anzu)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(read-mail-command (quote ignore))
 '(recentf-save-file "~/.recentf")
 '(safe-local-variable-values
   (quote
	((reftex-default-bibliography . "os.bib")
	 (reftex-default-bibliography . "ref.bib")
	 (TeX─master . t))))
 '(scheme-program-name "guile")
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(setq (quote (RCS CVS SVN SCCS SRC Bzr Git Hg Mtn)) t)
 '(shell-command-with-editor-mode t)
 '(tool-bar-button-margin 1 t)
 '(tool-bar-mode nil)
 '(track-eol t)
 '(unibyte-display-via-language-environment t)
 '(unicode-fonts-block-font-mapping
   (quote
	(("Arrows"
	  ("DejaVu Sans Mono" "Symbola" "Noto Sans Symbols"))
	 ("Block Elements"
	  ("DejaVu Sans Mono" "Noto Sans Symbols" "Symbola"))
	 ("Box Drawing"
	  ("DejaVuSansMono Nerd Font" "Quivira" "NotoMono Nerd Font" "Symbola"))
	 ("Dingbats"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Emoticons"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola" "Quivira"))
	 ("Enclosed Alphanumeric Supplement"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Enclosed Alphanumerics"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Enclosed CJK Letters and Months"
	  ("WenQuanYi Zen Hei Mono"))
	 ("Enclosed Ideographic Supplement"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Geometric Shapes"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Segoe UI Symbol" "Arial Unicode MS" "Symbola" "Noto Sans Symbols" "Quivira" "BabelStone Modern" "Everson Mono" "FreeMono" "Code2000"))
	 ("Geometric Shapes Extended"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Letterlike Symbols"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Miscellaneous Mathematical Symbols-A"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Miscellaneous Mathematical Symbols-B"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Miscellaneous Symbols"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Miscellaneous Symbols and Arrows"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Miscellaneous Symbols and Pictographs"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola" "Quivira"))
	 ("Miscellaneous Technical"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Musical Symbols"
	  ("Noto Sans Symbols" "DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola" "Quivira"))
	 ("Number Forms"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Optical Character Recognition"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Noto Sans Symbols" "Symbola"))
	 ("Ornamental Dingbats"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Playing Cards"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Small Form Variants"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "WenQuanYi Zen Hei Mono" "Microsoft YaHei" "Microsoft YaHei UI" "Code2000"))
	 ("Specials"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Superscripts and Subscripts"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Arrows-A"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Arrows-B"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Arrows-C"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Mathematical Operators"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Punctuation"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplemental Symbols and Pictographs"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola"))
	 ("Supplementary Private Use Area-A"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font"))
	 ("Supplementary Private Use Area-B"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font"))
	 ("Transport and Map Symbols"
	  ("DejaVuSansMono Nerd Font" "NotoMono Nerd Font" "Symbola")))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
	((20 . "#BC8383")
	 (40 . "#CC9393")
	 (60 . "#DFAF8F")
	 (80 . "#D0BF8F")
	 (100 . "#E0CF9F")
	 (120 . "#F0DFAF")
	 (140 . "#5F7F5F")
	 (160 . "#7F9F7F")
	 (180 . "#8FB28F")
	 (200 . "#9FC59F")
	 (220 . "#AFD8AF")
	 (240 . "#BFEBBF")
	 (260 . "#93E0E3")
	 (280 . "#6CA0A3")
	 (300 . "#7CB8BB")
	 (320 . "#8CD0D3")
	 (340 . "#94BFF3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(version-control (quote never))
 '(view-diary-entries-initially t)
 '(view-read-only t)
 '(visible-bell t)
 '(warning-minimum-level :emergency)
 '(warning-minimum-log-level :emergency)
 '(warning-suppress-types (quote ((\(undo\ discard-info\)))))
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 240 :family "DejaVuSansMono Nerd Font"))))
 '(mode-line ((t (:height 160 :family "DejaVuSansMono Nerd Font")))))
