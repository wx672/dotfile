;;; init-20-helm.el --- helm

;;; Commentary:
;; Mostly configures helm-mode, which is great for getting around
;; For more on Helm, see:
;;     http://tuhdo.github.io/helm-intro.html
;;     https://github.com/emacs-helm/helm/wiki

;;; Code:

;; == Helm Mode ==
(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (use-package helm-files)
  (use-package helm-command)
  (use-package helm-config)
  
  ;; Changes the helm prefix key
  ;; (global-set-key (kbd "C-c h") 'helm-command-prefix-key)
  ;; (global-unset-key (kbd "C-x c"))

  ;; Supress warning
  (setq ad-redefinition-action 'accept)

  :config
  (use-package helm-ag
	:ensure wgrep-ag
	:init
	(setq helm-follow-mode-persistent t
		  helm-ag-base-command "ag --nocolor --nogroup --ignore-case"
		  helm-ag-command-option "--all-text"
		  helm-ag-insert-at-point 'symbol
		  helm-ag-ignore-buffer-patterns '("\\.aux\\'" "\\.auxlock\\'"))

	:bind (:map global-map ("M-?" . helm-ag)))

  ;; (use-package helm-projectile
  ;;   :init
  ;;   (helm-projectile-on)
  ;;   )
  
  (setq
   helm-full-frame t
   helm-split-window-inside-p           t
   helm-move-to-line-cycle-in-source     t
   helm-ff-search-library-in-sexp        t
   helm-scroll-amount                    8
   helm-M-x-fuzzy-match                  t
   helm-ff-file-name-history-use-recentf t
   helm-grep-default-command "grep --color=always -d skip %e -n%cH -e %p %f"
   helm-grep-default-recurse-command "grep --color=always -d recurse %e -n%cH -e %p %f")

  (helm-mode 1)
  
  :bind (
		 ("C-x b" . helm-mini)
		 ("C-x C-f" . helm-find-files)
		 ("M-x" . helm-M-x)
		 ("M-y" . helm-show-kill-ring)
		 :map helm-map
		 ("[tab]" . helm-execute-persistent-action)
		 ("C-i" . helm-execute-persistent-action)
		 ("C-z" . helm-select-action))
  )

(provide 'init-20-helm)
;;; init-20-helm.el ends here
