;;; 90-face.el --- Customize the look of emacs

;;; Commentary:
;; theme; variables

;;; Code:

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 240 :family "FiraCode Nerd Font"))))
 '(cursor ((t (:background "violet"))));indian red
 '(mode-line ((t (:height 0.8))))
 '(org-table ((t (:family "Noto Sans Mono CJK SC")))))


;; == Load Custom Theme ==

;;; Material
;; (use-package material-theme
;;   :config
;;   (load-theme 'material t)
;;   (load-theme 'material-light t))

;; (use-package almost-mono-theme
;;   :config
;;   ;; (load-theme 'almost-mono-white t)
;;   ;; (load-theme 'almost-mono-black t)
;;   ;; (load-theme 'almost-mono-gray t)
;;   (load-theme 'almost-mono-cream t)
;;   )

;; (use-package sketch-theme
;;   :config
;;   (load-theme 'sketch-black t)
;;   ;; (load-theme 'sketch-white t)
;;   )

;; (enable-theme 'creame) ; custom theme (../creame-theme.el)

;; (load-theme 'dark) ; custom theme (../dark-theme.el)

;;https://config.daviwil.com/emacs
;;https://github.com/bbingju/literate-emacs-configuration/blob/master/README.org
;;(use-package spacegray-theme :disabled t :defer t)

(use-package doom-themes
  :ensure t
  :defer t
  :init (load-theme 'doom-palenight t) ;doom-one, doom-nord, doom-snazzy, doom-vibrant
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

;; transparency
;; (set-frame-parameter (selected-frame) 'alpha '(90 . 90))
;; (add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :custom-face
  '(mode-line ((t (:height 0.5))))
  '(mode-line-inactive ((t (:height 0.5))))
  :custom
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
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-persp-icon t)
  (doom-modeline-modal-icon t)
  (doom-modeline-lsp t)
  (doom-modeline-buffer-encoding nil)
  )

;; https://lucidmanager.org/productivity/ricing-org-mode/
;; https://gitlab.com/jabranham/mixed-pitch
(use-package mixed-pitch
  :disabled
  :hook
  (text-mode . mixed-pitch-mode)
  ;; :config
  ;; (set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 240)
  ;; (set-face-attribute 'fixed-pitch nil :font "Noto Sans Mono CJK SC")
  ;; (set-face-attribute 'variable-pitch nil :font "DejaVu Sans")
)

(provide '90-face)
;;; 90-face.el ends here
