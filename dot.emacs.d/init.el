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
(setq package-enable-at-startup nil)
(setq package-archives
      (append package-archives
			  '(("melpa" . "http://melpa.org/packages/")
				("gnu" . "http://elpa.gnu.org/packages/"))))

(package-initialize)

;;; Enable use-package
(eval-and-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;; Set the path variable
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(mapc #'(lambda (path)
	  (add-to-list 'load-path
				   (expand-file-name path user-emacs-directory)))
      '("lisp" "site-lisp"))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file 'noerror)
(load-file (expand-file-name "registers" user-emacs-directory))

(use-package socks
  :ensure url
  :init
  (setq socks-override-functions 1
		url-gateway-method 'socks
		socks-noproxy '("localhost")
		socks-server '("Default server" "127.0.0.1" 1080 5)))

(require 'init-00-utils)
(require 'init-10-face)
(require 'init-20-helm)
(require 'init-30-tex)
(require 'init-31-org)
(require 'init-globalkeys)
(require 'init-pyim)

(use-package company
  :diminish company-mode
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

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets")
  (yas-load-directory "/usr/share/yasnippet-snippets"))

(use-package flycheck
  :init
;  (global-flycheck-mode)
  (setq
   flycheck-check-syntax-automatically '(save idle-change mode-enabled)
   flycheck-idle-change-delay 0.8
   flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list))

(use-package ispell
  :config
  (setq ispell-dictionary "english")
  (when (executable-find ispell-program-name)
	(use-package flyspell
	  :config
	  (if (fboundp 'prog-mode)
		  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
		(dolist (hook '(lisp-mode-hook emacs-lisp-mode-hook
						scheme-mode-hook clojure-mode-hook
						ruby-mode-hook yaml-mode python-mode-hook
						shell-mode-hook php-mode-hook
						css-mode-hook haskell-mode-hook
						caml-mode-hook nxml-mode-hook
						crontab-mode-hook perl-mode-hook
						tcl-mode-hook javascript-mode-hook))
		  (add-hook hook 'flyspell-prog-mode)))
	  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))))

(use-package printing
  :init
  (setq ps-use-face-background nil
		ps-print-header nil
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

(use-package pdf-tools
  :pin manual
  :init (pdf-tools-install)
  :bind (:map pdf-view-mode-map
			  ("T" . pdf-annot-add-text-annotation)
			  ("D" . pdf-annot-delete)
			  ("t" . pdf-annot-add-highlight-markup-annotation)
			  ("j" . image-next-line)
			  ("k" . image-previous-line)
			  ("l" . image-forward-hscroll)
			  ("h" . image-backward-hscroll)
			  ("G" . pdf-view-last-page)
			  ("g" . nil)
			  ("gg" . pdf-view-first-page)
			  ("C-c C-c" . image-toggle-display)
			  ("C-s" . isearch-forward))
  :config
  (setq-default pdf-view-display-size 'fit-page)
  (setq yas-minor-mode nil
		pdf-view-resize-factor 1.1
		pdf-isearch-batch-mode t
		pdf-annot-activate-created-annotations t))

(use-package dict
  :config
  (setq
   dict-original-server "localhost"
   dict-servers '("localhost")
   ;; dictionary-server "localhost"
   dict-databases '("wn" "gcide" "foldoc" "jargon" "moby-tresaurus" "vera" "langdao-ce" "langdao-ec")
   dict-enable-key-bindings t
   dict-noauth t
   dict-show-one-window t)

  (dict-update-key-bindings)
  (dict-mode-update-key-bindings))

(use-package nasm-mode
  :config (add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\|nas\\)$" . nasm-mode)))

(use-package helm-gtags
  :init
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  (add-hook 'nasm-mode-hook 'helm-gtags-mode)

  :bind (:map helm-gtags-mode
	 ("M-." . helm-gtags-find-tag)
	 ("M-," . helm-gtags-find-rtag)
	 ("M-s" . helm-gtags-find-symbol)))

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (setq web-mode-engines-alist
		'(("php"    . "\\.phtml\\'")
		  ("blade"  . "\\.blade\\."))))

(use-package csv-mode
  :ensure csv-nav
  :config
  (use-package init-00-utils
    :config (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'"))
  (setq csv-separators '("," ";" "|" " ")))

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

(electric-pair-mode 1)
(show-paren-mode 1)

(use-package recentf
  :init
  (run-at-time nil 1800 'recentf-save-list)
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-item 10)
  (global-set-key (kbd "C-x C-r") 'recentf-open-files))

;; Nicer naming of buffers for files with identical names
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'reverse
		uniquify-separator " @ "
		uniquify-after-kill-buffer-p t
		uniquify-ignore-buffers-re "^\\*"))

(save-place-mode 1)
(setq save-place-forget-unreadable-files t)

(global-anzu-mode +1)

(setq-default tab-width 4)

(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)
;;; init.el ends here
