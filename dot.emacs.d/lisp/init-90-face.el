;;; init-10-face.el --- Customize the look of emacs

;;; Commentary:
;; theme; variables

;;; Code:

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
(load-theme 'dark) ; custom theme (../dark-theme.el)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq tab-width 4)

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font t charset (font-spec :family "Noto Sans Mono CJK SC" :size 26)))
					 
;; Symbols
(set-fontset-font t 'symbol (font-spec :family "Symbola"))

(set-fontset-font "fontset-default"  '(#xe200 . #xf4a8) (font-spec :family "DejaVu Sans Mono Nerd Font Complete Mono"))

(set-fontset-font "fontset-default"  '(#x1f000 . #x1f9e6) (font-spec :family "Symbola"))

(provide 'init-90-face)
;;; init-10-face.el ends here
