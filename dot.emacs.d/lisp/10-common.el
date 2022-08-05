;;; 10-common.el

;;; Commentary:
;; common settings used to be added by Custom.

;;; Code:

(blink-cursor-mode -1)
(column-number-mode t)
(cua-mode -1)
(cua-selection-mode -1)
(display-battery-mode t)
(display-time-mode)
(electric-pair-mode 1)
(global-auto-revert-mode t)
(global-font-lock-mode 1)
(global-hi-lock-mode 1)
(global-hl-line-mode -1)
(global-prettify-symbols-mode)
(menu-bar-mode -1)
(recentf-mode 1)
(run-at-time nil 300 'recentf-save-list)
(save-place-mode 1)
(scroll-bar-mode -1)
(set-fringe-mode 1)
(show-paren-mode 1)
(tool-bar-mode -1)
(tooltip-mode -1)

(setq
 ad-redefinition-action 'accept ;Don't warn when advice is added for functions
 blink-cursor-interval 1
 bookmark-save-flag 1
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program (executable-find "x-www-browser")
 case-fold-search t
 confirm-kill-emacs nil
 cua-auto-tabify-rectangles nil
 debug-on-error nil
 dired-guess-shell-alist-user nil
 dired-listing-switches "-lAG --group-directories-first --time-style=long-iso"
 dired-omit-extensions '("~" ".a" ".aux" ".bbl" ".bcf" ".blg" ".elc" ".idx" ".lof" ".log" ".lot" ".toc" ".snm" ".nav" ".out" ".run.xml" ".synctex.gz")
 dired-recursive-copies t
 dired-recursive-deletes t
 display-line-numbers-type 'visual
 display-time-24hr-format t
 display-time-day-and-date t
 display-time-format nil
 display-time-use-mail-icon t
 fill-column 90
 global-auto-revert-non-file-buffers t
 indent-tabs-mode t
 inhibit-startup-message t
 large-file-warning-threshold nil
 make-backup-files nil
 read-mail-command 'ignore
 recentf-auto-cleanup 300
 recentf-exclude '(".*elpa.*" ".*synctex.*")
 save-place-forget-unreadable-files t
 scroll-step 1
 select-enable-clipboard t
 shell-command-with-editor-mode t
 track-eol t
 use-dialog-box nil
 vc-follow-symlinks t
 version-control 'never
 view-read-only t
 visible-bell t
)

(setq-default
 tab-width 4
 ;;cursor-type '(bar . 4)
 cursor-type 'box
 )

(provide '10-common)
;;; 10-common.el ends here
