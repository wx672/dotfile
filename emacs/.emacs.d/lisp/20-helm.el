;;; 20-helm.el --- helm

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
  (setq ad-redefinition-action 'accept) ; Supress warning

  :general
  (:prefix "C-x"
		   "b"   #'helm-mini
		   "C-b" #'helm-mini
		   "C-r" #'helm-recentf
		   "C-f" #'helm-find-files
		   "rb"  #'helm-bookmarks)
   
  (helm-map 
   "<tab>"   #'helm-execute-persistent-action
   "C-i"     #'helm-execute-persistent-action
   "C-z"     #'helm-select-action
   )

  :config
  (setq
   helm-full-frame                       t
   helm-autoresize-mode					 t
   helm-split-window-inside-p            t
   helm-recentf-fuzzy-match              t
   helm-move-to-line-cycle-in-source     t
   helm-ff-search-library-in-sexp        t
   helm-scroll-amount                    8
   helm-M-x-fuzzy-match                  t
   helm-ff-file-name-history-use-recentf t
   helm-grep-default-command "grep --color=always -d skip %e -n%cH -e %p %f"
   helm-grep-default-recurse-command "grep --color=always -d recurse %e -n%cH -e %p %f")  
  
  (helm-mode 1)
  )

(use-package helm-gtags
  :ensure t
  :hook
  ((c-mode c++-mode asm-mode nasm-mode) . helm-gtags-mode)

  :bind (:map helm-gtags-mode
	      ("M-." . helm-gtags-find-tag)
	      ("M-," . helm-gtags-find-rtag)
	      ("M-s" . helm-gtags-find-symbol)))

(provide '20-helm)
;;; 20-helm.el ends here
