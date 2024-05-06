;;; 15-minors.el --- Minor modes

;;; Commentary:
;; vertico, orderless, maginalia, embark, smartparens, which-key, socks, vterm
;; https://github.com/minad/vertico
;; info vertico
;; https://github.com/Malabarba/beacon

;;; Code:

;; vterm

(use-package vterm
  :disabled
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000
		vterm-timer-delay 0.01
		)
  (general-unbind vterm-mode-map
	"M-l" nil
	"M-j" nil
	"M-k" nil
	"M-n" nil
	"M-p" nil
	"M-<backspace>" nil
	)
  )

;; https://github.com/minad/vertico
;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  :general
  (vertico-map
   "?" #'minibuffer-completion-help
   "M-RET" #'minibuffer-force-complete-and-exit
   "M-TAB" #'minibuffer-complete
   )
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; (use-package embark-consult
;;   :ensure t
;;   :after (embark consult)
;;   :demand t ; only necessary if you have the hook below
;;   ;; if you want to have consult previews as you move around an
;;   ;; auto-updating embark collect buffer
;;   :hook
;;   (embark-collect-mode . consult-preview-at-point-mode))

(use-package beacon
  :config
  (progn
    (setq beacon-blink-when-point-moves-vertically nil ; default nil
		  beacon-blink-when-point-moves-horizontally nil ; default nil
		  beacon-blink-when-buffer-changes t ; default t
		  beacon-blink-when-window-scrolls t ; default t
		  beacon-blink-when-window-changes t ; default t
		  beacon-blink-when-focused nil ; default nil
		  beacon-blink-duration 0.3 ; default 0.3
		  beacon-blink-delay 0.3 ; default 0.3
		  beacon-size 20 ; default 40
		  beacon-color "violet" ; default 0.5
		  )

    (add-to-list 'beacon-dont-blink-major-modes 'term-mode)

    (beacon-mode 1)))

;; https://github.com/Fuco1/smartparens
;; https://ebzzry.com/en/emacs-pairs/
(use-package smartparens-config
  :disabled
  :ensure smartparens
  :config
  (progn (show-smartparens-global-mode t))
  (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
  (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
  )

(use-package which-key
  :disabled
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; https://github.com/Fanael/rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package socks
  :disabled
  :ensure url
  :init
  (setq socks-override-functions 1
	url-gateway-method 'socks
	socks-noproxy '("localhost")
	socks-server '("Default server" "localhost" 1080 5)))

(use-package yasnippet
  :ensure t
  :config
  ;; https://github.com/joaotavora/yasnippet
  ;; (setq yas-snippet-dirs
  ;; 		'("~/.emacs.d/snippets" ;; personal snippets
  ;;         "/path/to/some/collection/" ;; foo-mode and bar-mode snippet collection
  ;;         ))
  ;;
  (yas-global-mode 1)
  ;;
  ;; Use yas-minor-mode on a per-buffer basis
  ;; (yas-minor-mode)
  ;; (yas-reload-all)
  )

;; https://github.com/leoliu/ggtags
;; (use-package ggtags-mode
;;   :hook ((emacs-startup . ggtags-mode)))

;; https://github.com/Ergus/gtags-mode
;; (use-package gtags-mode
;;   :hook ((emacs-startup . gtags-mode)))

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

;; Nicer naming of buffers for files with identical names
;; (use-package uniquify
;;   :ensure t
;;   :custom
;;   (uniquify-buffer-name-style 'reverse)
;;   (uniquify-separator " @ ")
;;   (uniquify-after-kill-buffer-p t)
;;   (uniquify-ignore-buffers-re "^\\*"))

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

(display-line-numbers-mode)

(provide '15-minors)
;;; 15-minors.el ends here
