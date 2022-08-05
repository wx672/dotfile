;;; init.el --- init

;;; Commentary:
;; Code inspired by:
;;      http://stackoverflow.com/a/10093312/3672986
;;      http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;;      https://github.com/jwiegley/use-package

;;; Code:

(require 'package)

(setq package-archives
      '(;; ("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
        ;; ("melpa" . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
		;; ("org"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
		;; ("gnu" . "http://elpa.emacs-china.org/gnu/")
		;; ("melpa" . "http://elpa.emacs-china.org/melpa/")
		;; ("org" . "http://elpa.emacs-china.org/org/")
		("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
		("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")
		("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
		;; ("gnu"   . "http://elpa.gnu.org/packages/")
        ;; ("melpa" . "http://melpa.org/packages/")
		))

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
;;(require 'bind-key) ; use general.el instead

(require 'server)
(unless (server-running-p) (server-start))

;; https://config.daviwil.com/emacs
;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
(setq
 user-emacs-directory (expand-file-name "~/.cache/emacs/")
 url-history-file (expand-file-name "url/history" user-emacs-directory))

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(use-package no-littering)

;; Keep customization settings in a temporary file (thanks Ambrevar!)
(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(load custom-file t)

;; Add my library path to load-path
;;(push (expand-file-name "lisp" startup--xdg-config-home-emacs) load-path)
(push "~/.emacs.d/lisp" load-path)

(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(require '10-common)
(require '15-keys)
(require '15-minors)
(require '20-consult); or helm
;; (require '25-persp)
(require '25-citar)
(require '30-tex)
(require '31-org)
(require '35-web)
(require '37-pyim)
(require '40-print)
(require '50-company)
(require '50-pdftools)
(require '90-face)

(use-package yasnippet
  :ensure t
  :config
  (yas-minor-mode)
  (yas-global-mode 1)
  (yas-reload-all))

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

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(setq gdb-many-windows t)

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
;; (use-package uniquify
;;   :ensure t
;;   :custom
;;   (uniquify-buffer-name-style 'reverse)
;;   (uniquify-separator " @ ")
;;   (uniquify-after-kill-buffer-p t)
;;   (uniquify-ignore-buffers-re "^\\*"))

(setq auto-mode-alist
      (cons '("/rfc[0-9]+\\.txt\\(\\.gz\\)?\\'" . rfcview-mode)
	    auto-mode-alist))

(autoload 'rfcview-mode "rfcview" nil t)

;; (add-hook 'outline-minor-mode-hook
;;           (lambda ()
;;             (require 'outline-magic)
;;             (define-key outline-minor-mode-map [(tab)] 'outline-cycle)))

(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

(provide 'init)
;;; init.el ends here
