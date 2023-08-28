;;; 92-fonts.el --- Customize fonts

;;; Commentary:

;;; Code:

;; !!!cnfonts doesn't work well!!!
;; (require 'cnfonts)
;; 让 cnfonts 在 Emacs 启动时自动生效。
;; (cnfonts-mode 1)
;; 添加两个字号增大缩小的快捷键
;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)
    
;; Chinese
;; (set-fontset-font t 'han (font-spec :family "LXGW Bright"))
;; (set-fontset-font 
;;  t
;;  'han
;;  (cond ; the first matching is used
;;   ((member "LXGW Bright GB" (font-family-list)) "LXGW Bright GB")
;;   ((member "LXGW Bright TC" (font-family-list)) "LXGW Bright TC")
;;   ((member "Noto Sans Mono CJK SC" (font-family-list)) "Noto Sans Mono CJK SC")
;;   ))

;; Symbols
;;(set-fontset-font t 'symbol (font-spec :family "Symbola Nerd Font"));JetBrainsMono Nerd Font

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

(setq unibyte-display-via-language-environment t)

(provide '92-fonts)
;;; 92-fonts.el ends here
