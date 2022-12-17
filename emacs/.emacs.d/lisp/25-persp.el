;;; 25-persp.el

;;; Commentary:
;; https://github.com/nex3/perspective-el

;;; Code:

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  ("C-x k" . persp-kill-buffer*)
  ("M-p" . persp-switch-to-buffer*)
  ("M-n" . persp-switch-to-buffer*)

  :custom
  (persp-mode-prefix-key (kbd "C-z"))  ; pick your own prefix key here

  :init
  (persp-mode)
  (add-hook 'kill-emacs-hook #'persp-state-save)
)

(provide '25-persp)
;;; 25-persp.el ends here
