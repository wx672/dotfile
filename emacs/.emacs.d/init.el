;;; init.el --- init

;;; Commentary:
;; Code inspired by:
;;      http://stackoverflow.com/a/10093312/3672986
;;      http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;;      https://github.com/jwiegley/use-package

;;; Code:

(require 'package)

(setq
 package-archives
 '(;; ("gnu"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
   ;; ("melpa" . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
   ;; ("org"   . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
   ;; ("gnu" . "http://elpa.emacs-china.org/gnu/")
   ;; ("melpa" . "http://elpa.emacs-china.org/melpa/")
   ;; ("org" . "http://elpa.emacs-china.org/org/")
   ;; ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")
   ("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
   ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")
   ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
   ;; ("gnu"   . "http://elpa.gnu.org/packages/")
   ;; ("melpa" . "https://melpa.org/packages/")
   )
 package-user-dir "~/.emacs.d/elpa"
 )

;; no need since the variable package-enable-at-startup is default to t
(package-initialize)

(setq warning-minimum-level :emergency)

;;; HINT: 'c-h P' to see package details
(require 'use-package)
(require 'diminish)
;;(require 'bind-key) ; use general.el instead

(require 'server)
(unless (server-running-p) (server-start))

;; keep unwanted things out of ~/.emacs.d
;; https://config.daviwil.com/emacs
(use-package no-littering
  :ensure t
  :init
  (setq
   user-emacs-directory (expand-file-name "~/.cache/emacs/")
   url-history-file (expand-file-name "var/url/history" user-emacs-directory)
   custom-file (expand-file-name "custom.el" user-emacs-directory)
   )
  ;; Set eln-cache dir
  (when (boundp 'native-comp-eln-load-path)
	(startup-redirect-eln-cache
	 (expand-file-name "eln-cache/" user-emacs-directory)))
  )

(load custom-file t)

;; Add my library path to load-path
;;(push (expand-file-name "lisp" startup--xdg-config-home-emacs) load-path)
(push "~/.emacs.d/lisp" load-path)

(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(require '10-common)
(require '90-face)
(require '92-fonts)
(require '15-keys)
(require '15-minors)
(require '20-consult); or helm
;; (require '25-persp)
(require '25-citar)
(require '30-tex)
(require '31-org)
(require '35-web)
;(require '37-pyim)
(require '40-print)
(require '50-company)
(require '50-pdftools)
(provide 'init)
;;; init.el ends here
