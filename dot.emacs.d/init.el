;;; init.el --- init

;;; Commentary:
;; Calls my Emacs configuration files after installing use-package, which is
;; necessary for operation.  See also:
;;      http://www.cachestocaches.com/2015/8/getting-started-use-package/
;;
;; Code inspired by:
;;      http://stackoverflow.com/a/10093312/3672986
;;      http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;;      https://github.com/jwiegley/use-package

;;; Code:

(require 'package)

(setq package-archives
      '(;; ("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
        ("melpa" . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
		;; ("org"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
		;; ("gnu"   . "http://elpa.gnu.org/packages/")
        ;; ("melpa" . "http://melpa.org/packages/")
		))

;; (append package-archives
;; 	'(("melpa" . "https://stable.melpa.org/packages/")
;; 	  ("gnu" . "https://elpa.gnu.org/packages/")
;; 	  ("org" . "https://orgmode.org/elpa/")))

;; no need since the variable package-enable-at-startup is default to t
(package-initialize)

;;; quicklisp and slime are for playing with stumpwm
;;
;; (defvar quicklisp-path "~/quicklisp")
;; (quicklisp-quickstart:install :proxy "http://localhost:7890/")
;;
;; ;; Load slime-helper, this sets up various autoloads:
;; (load (concat quicklisp-path "/slime-helper"))
;; ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;;
;; ;; Set up slime with whatever modules you decide to use:
;; (slime-setup '(slime-fancy slime-mrepl slime-banner slime-tramp
;; 	       slime-xref-browser slime-highlight-edits
;; 	       slime-sprof))
;;
;; (setq inferior-lisp-program "/usr/bin/sbcl") ;; for slime

;;; HINT: 'c-h P' to see package details
(require 'use-package)
(require 'diminish)
(require 'bind-key)

(mapc #'(lambda (path)
	  (add-to-list 'load-path
		       (expand-file-name path user-emacs-directory)))
      '("lisp" "site-lisp"))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file 'noerror)
(load (expand-file-name "registers" user-emacs-directory) 'noerror)

;; (use-package socks
;;   :disabled
;;   :ensure url
;;   :init
;;   (setq socks-override-functions 1
;; 	url-gateway-method 'socks
;; 	socks-noproxy '("localhost")
;; 	socks-server '("Default server" "localhost" 7891 5)))

(show-paren-mode 1)
(electric-pair-mode 1)
(save-place-mode 1)
(setq save-place-forget-unreadable-files t)
(setq-default tab-width 4)

(require 'init-20-helm)
(require 'init-30-tex)
(require 'init-31-org)
(require 'init-35-web)
(require 'init-globalkeys)
(require 'init-pyim)
(require 'init-40-print)
(require 'init-50-company)
(require 'init-50-pdftools)
(require 'init-90-face)

(use-package yasnippet
  :ensure t
  :config
  (yas-minor-mode)
  (yas-global-mode 1)
  (yas-reload-all))

(use-package helm-gtags
  :ensure t
  :hook
  ((c-mode c++-mode asm-mode nasm-mode) . helm-gtags-mode)

  :bind (:map helm-gtags-mode
	      ("M-." . helm-gtags-find-tag)
	      ("M-," . helm-gtags-find-rtag)
	      ("M-s" . helm-gtags-find-symbol)))

(use-package ispell
  :ensure t
  :custom
  (ispell-local-dictionary "en_US")
  (ispell-local-dictionary-alist
   '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))

(use-package nasm-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\|nas\\)$" . nasm-mode)))

;; https://github.com/jorgenschaefer/elpy
;; (use-package elpy
;;   :disabled
;;   :ensure t
;;   :init
;;   (elpy-enable))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook
          (lambda() (local-set-key (kbd "C-c C-c") #'compile)))

;;; Enable disabled commands

(put 'downcase-region             'disabled nil)   ; Let downcasing work
(put 'erase-buffer                'disabled nil)
(put 'eval-expression             'disabled nil)   ; Let ESC-ESC work
(put 'narrow-to-page              'disabled nil)   ; Let narrowing work
(put 'narrow-to-region            'disabled nil)   ; Let narrowing work
(put 'set-goal-column             'disabled nil)
(put 'upcase-region               'disabled nil)   ; Let upcasing work
(put 'company-coq-fold            'disabled nil)
(put 'TeX-narrow-to-group         'disabled nil)
(put 'LaTeX-narrow-to-environment 'disabled nil)

;; Nicer naming of buffers for files with identical names
(use-package uniquify
  :ensure t
  :custom
  (uniquify-buffer-name-style 'reverse)
  (uniquify-separator " @ ")
  (uniquify-after-kill-buffer-p t)
  (uniquify-ignore-buffers-re "^\\*"))

(setq auto-mode-alist
      (cons '("/rfc[0-9]+\\.txt\\(\\.gz\\)?\\'" . rfcview-mode)
	    auto-mode-alist))

(autoload 'rfcview-mode "rfcview" nil t)

;; (add-hook 'outline-minor-mode-hook
;;           (lambda ()
;;             (require 'outline-magic)
;;             (define-key outline-minor-mode-map [(tab)] 'outline-cycle)))

(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
;;; init.el ends here
