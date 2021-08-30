;;; init-40-print.el --- initializing printing

;;; Commentary:
;; printing configuration
;;

;;; Code:

(use-package printing
  :init
  (setq ps-use-face-background nil
	ps-print-header nil
	ps-line-number nil
	ps-always-build-face-reference t
	ps-build-face-reference t
	ps-default-fg t)
  
  (ps-extend-face '(font-lock-keyword-face "blue" nil bold) 'MERGE)
  (ps-extend-face '(font-lock-type-face "dark red" nil bold) 'MERGE)
  (ps-extend-face '(font-lock-string-face "red2" nil italic) 'MERGE)
  (ps-extend-face '(font-lock-comment-face "red2" nil italic) 'MERGE)
  (ps-extend-face '(font-lock-comment-delimiter-face "red2" nil italic) 'MERGE)
  (ps-extend-face '(font-lock-function-name-face "firebrick" nil bold) 'MERGE)
  (ps-extend-face '(font-lock-variable-name-face nil nil nil) 'MERGE)
  (ps-extend-face '(font-lock-builtin-face "dark green" nil nil) 'MERGE)
  (ps-extend-face '(font-lock-constant-face "dark blue" nil nil) 'MERGE))

(provide 'init-40-print)

;;; init-40-print.el ends here
