;;; 70-flycheck.el --- initializing flycheck

;;; Commentary:
;; flycheck configuration
;;

;;; Code:

(use-package flycheck
  :disabled
  :init
  (setq
   flycheck-check-syntax-automatically '(save idle-change mode-enabled)
   flycheck-idle-change-delay 0.8
   flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list))

(provide '70-flycheck)

;;; 70-flycheck.el ends here
