;;; init-10-face.el --- Customize the look of emacs

;;; Commentary:
;; theme; variables

;;; Code:

;; == Load Custom Theme ==

;;; Material
(use-package material-theme
  :init (load-theme 'material-light t))

(enable-theme 'material-light)

;;; Zenburn
;; (use-package zenburn-theme
;;   :init (load-theme 'zenburn t))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font t ;;(frame-parameter nil 'font)
                    charset (font-spec :family "Noto Sans Mono CJK SC"
                                       :size 26)))
;; Symbols
(set-fontset-font t 'symbol (font-spec :family "Symbola"))

(set-fontset-font "fontset-default"  '(#xe200 . #xf4a8) (font-spec :family "DejaVu Sans Mono Nerd Font Complete"))

(set-fontset-font "fontset-default"  '(#x1f000 . #x1f9e6) (font-spec :family "Symbola"))

(provide 'init-10-face)
;;; init-10-face.el ends here
