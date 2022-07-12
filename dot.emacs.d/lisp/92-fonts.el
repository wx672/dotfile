;;; 92-fonts.el --- Customize fonts

;;; Commentary:

;;; Code:

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font t charset (font-spec :family "Noto Sans Mono CJK SC" :size 26)))
					 
;; Symbols
(set-fontset-font t 'symbol (font-spec :family "Symbola"))

(setq unibyte-display-via-language-environment t)

;; (set-fontset-font "fontset-default"  '(#xe104 . #xe1ae) (font-spec :family "Linux Biolinum Keyboard O"))
;; (set-fontset-font "fontset-default"  '(#x2500 . #x25ff) (font-spec :family "DejaVuSansMono Nerd Font"));table drawing
;; (set-fontset-font "fontset-default"  '(#x2600 . #x2aff) (font-spec :family "DejaVuSansMono Nerd Font"));
;; (set-fontset-font "fontset-default"  '(#xe200 . #xe2af) (font-spec :family "DejaVuSansMono Nerd Font"));
;; (set-fontset-font "fontset-default"  '(#xe2b0 . #xe2ff) (font-spec :family "Symbola"));
;; (set-fontset-font "fontset-default"  '(#xe300 . #xe3e3) (font-spec :family "DejaVuSansMono Nerd Font")); weather
;; (set-fontset-font "fontset-default"  '(#xe5fa . #xe62e) (font-spec :family "DejaVuSansMono Nerd Font"));
;; (set-fontset-font "fontset-default"  '(#xe700 . #xe7c5) (font-spec :family "DejaVuSansMono Nerd Font"));
;; (set-fontset-font "fontset-default"  '(#xf000 . #xf31c) (font-spec :family "DejaVuSansMono Nerd Font"));
;; (set-fontset-font "fontset-default"  '(#xf400 . #xf4a9) (font-spec :family "DejaVuSansMono Nerd Font"))
;; (set-fontset-font "fontset-default"  '(#xf500 . #xfd46) (font-spec :family "DejaVuSansMono Nerd Font"))
;; (set-fontset-font "fontset-default"  '(#x1f300 . #x1f6f8) (font-spec :family "Symbola"))


(provide '92-fonts)
;;; 92-fonts.el ends here
