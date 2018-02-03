(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program (executable-find "x-www-browser"))
 '(cal-tex-24 t)
 '(case-fold-search t)
 '(column-number-mode t)
 '(confirm-kill-emacs nil)
 '(cua-auto-tabify-rectangles nil)
 '(cua-selection-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(debug-on-error nil)
 '(default-major-mode (quote org-mode) t)
 '(dired-guess-shell-alist-user nil)
 '(dired-omit-extensions
   (quote
	(".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bcf" ".run.xml" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".snm" ".out" ".nav" ".out" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyg" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs")))
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
 '(fill-column 90)
 '(flyspell-issue-message-flag nil)
 '(fringe-mode (quote (1 . 1)) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-hl-line-mode t nil (hl-line))
 '(graphviz-dot-auto-indent-on-semi nil)
 '(helm-full-frame t)
 '(hi-lock-mode t t (hi-lock))
 '(inhibit-startup-screen t)
 '(ispell-extra-args (quote ("--reverse")))
 '(ispell-program-name "hunspell")
 '(linum-format "%d ")
 '(make-backup-files nil)
 '(mark-diary-entries-in-calendar t)
 '(menu-bar-mode nil)
 '(mode-line-in-non-selected-windows t)
 '(package-selected-packages
   (quote
	(nasm-mode web-mode yasnippet-snippets buttercup async helm zenburn-theme auctex gscholar-bibtex diminish helm-config helm-command helm-files org-ref ascii-art-to-unicode pyim fontawesome cnfonts yatemplate sicp org-pdfview org-chinese-utils markdown-mode+ htmlize helm-gtags helm-flyspell helm-flycheck helm-c-yasnippet helm-ag exec-path-from-shell csv-nav csv-mode company-quickhelp cider-eval-sexp-fu)))
 '(read-mail-command (quote ignore))
 '(safe-local-variable-values
   (quote
	((eval when
		   (require
			(quote rainbow-mode)
			nil t)
		   (rainbow-mode 1))
	 (TeX─master . t)
	 (reftex-default-bibliography "./os.bib"))))
 '(scheme-program-name "guile")
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(tool-bar-button-margin 1 t)
 '(tool-bar-mode nil)
 '(track-eol t)
 '(unibyte-display-via-language-environment t)
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
 '(default ((t (:height 165 :family "DejaVu Sans Mono"))))
 '(mode-line ((t (:background "#2B2B2B" :foreground "#8FB28F" :box (:line-width -1 :style released-button) :weight bold :height 120))))
 '(mode-line-buffer-id ((t (:foreground "#F0DFAF" :weight bold :width condensed))))
 '(mode-line-inactive ((t (:background "#2b2b2b" :foreground "#5F7F5F" :box nil :height 120)))))
