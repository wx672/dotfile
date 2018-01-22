;;; init-10-face.el --- Customize the look of emacs

;;; Commentary:
;; Zenburn theme; variables

;;; Code:

;; == Load Custom Theme ==

;;; Zenburn
(use-package zenburn-theme
  :init (load-theme 'zenburn t))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq tab-width 4) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; http://zhuoqiang.me/torture-emacs.html
;; ;; Setting English Font
;; (set-face-attribute 'default nil :font "Consolas 12")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font t ;;(frame-parameter nil 'font)
                    charset (font-spec :family "Noto Sans Mono CJK SC"
                                       :size 22)))

(provide 'init-10-face)
;;; init-10-face.el ends here
