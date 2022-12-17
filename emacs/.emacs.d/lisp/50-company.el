;;; 50-company.el --- initializing company

;;; Commentary:
;; cmopany-mode configuration
;;

;;; Code:

(use-package company
  :diminish co.
  :init
  ;; (setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev))

  (setq
   tab-always-indent 'complete
   completion-cycle-threshold 5)

  (add-to-list 'completion-styles 'initials t)

  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'after-init-hook 'company-tng-mode) ; conflict the yasnippet

  (use-package company-quickhelp
    :config (add-hook 'after-init-hook 'company-quickhelp-mode))

  :general
  (company-mode-map   "M-/" #'company-complete)
  (company-active-map
   "M-/" #'company-select-next
   "C-n" #'company-select-next
   "C-p" #'company-select-previous
   )
)

(provide '50-company)

;;; 50-company.el ends here
