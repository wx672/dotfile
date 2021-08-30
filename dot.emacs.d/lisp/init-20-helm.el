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

  ;; Supress warning
  (setq ad-redefinition-action 'accept)

  :config
  (setq
   helm-full-frame                       t
   helm-autoresize-mode					 t
   helm-split-window-inside-p            t
   helm-move-to-line-cycle-in-source     t
   helm-ff-search-library-in-sexp        t
   helm-scroll-amount                    8
   helm-M-x-fuzzy-match                  t
   helm-ff-file-name-history-use-recentf t
   helm-grep-default-command "grep --color=always -d skip %e -n%cH -e %p %f"
   helm-grep-default-recurse-command "grep --color=always -d recurse %e -n%cH -e %p %f")  
  
  (helm-mode 1)
  
  :bind
  (
   ("C-x b" . helm-mini)
   ("C-x C-b" . helm-mini)
   ("C-x C-r" . helm-recentf)
   ("C-x C-f" . helm-find-files)
   ("M-x" . helm-M-x)
   ("M-y" . helm-show-kill-ring)
   ("C-x r b" . helm-bookmarks)
   :map helm-map
   ("<f12>" . nil)
   ("[tab]" . helm-execute-persistent-action)
   ("C-i" . helm-execute-persistent-action)
   ("C-z" . helm-select-action))
  )

(provide 'init-20-helm)
;;; init-20-helm.el ends here
