;;; 90-face.el --- Customize the look of emacs

;;; Commentary:
;; theme; variables

;;; Code:

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 280 :family "JetBrainsMonoNL Nerd Font"))))
 '(cursor ((t (:background "violet"))));indian red
 '(mode-line ((t (:height 0.7))))
 ;; '(org-table ((t (:height 240 :family "Noto Sans Mono CJK SC Regular"))))
)

;; == Load Custom Theme ==

(use-package doom-themes
  ;; :disabled
  :ensure t
  :defer t
  :init (load-theme 'doom-palenight t) ;doom-one, doom-nord, doom-snazzy, doom-vibrant
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package nerd-icons
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(use-package doom-modeline
  :disabled
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-icon nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-minor-modes nil)
  (doom-modeline-display-misc-in-all-mode-lines nil)
  (inhibit-compacting-font-caches t) ;Don’t compact font caches during GC.
  (find-file-visit-truename t)
  (doom-modeline-height 1)
  (doom-modeline-bar-width 4)
  (doom-modeline-window-width-limit nil)
  (doom-modeline-lsp nil)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-hud nil)
  (doom-modeline-irc nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-buffer-state-icon nil)
  (doom-modeline-buffer-modification-icon nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-persp-icon nil)
  (doom-modeline-persp-name nil)
  (doom-modeline-modal-icon nil)
  )

(provide '90-face)
;;; 90-face.el ends here
