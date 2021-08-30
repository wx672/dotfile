;;; init-50-company.el --- initializing company

;;; Commentary:
;; cmopany-mode configuration
;;

;;; Code:

(use-package company
  :diminish co.
  :init
  (setq-default company-backends '((company-capf company-dabbrev-code) company-dabbrev))
  (setq tab-always-indent 'complete
	completion-cycle-threshold 5)
  (add-to-list 'completion-styles 'initials t)

  :bind
  (("M-C-/" . company-complet)
   :map company-mode-map ("M-/" . company-complete)
   :map company-active-map ("M-/" . company-select-next))

  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (use-package company-quickhelp
    :config (add-hook 'after-init-hook 'company-quickhelp-mode)))

(provide 'init-50-company)

;;; init-50-company.el ends here
