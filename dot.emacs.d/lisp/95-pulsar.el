;;; 95-pulsar.el --- initializing pulsar

;;; Commentary:
;; https://protesilaos.com/emacs/pulsar

;;; code:

(require 'pulsar)

(setq pulsar-pulse-functions
      ;; note 2022-04-09: the commented out functions are from before
      ;; the introduction of `pulsar-pulse-on-window-change'.  try that
      ;; instead.
      '(recenter-top-bottom
        move-to-window-line-top-bottom
        reposition-window
        ;; bookmark-jump
        ;; other-window
        ;; delete-window
        ;; delete-other-windows
        forward-page
        backward-page
        scroll-up-command
        scroll-down-command
        ;; windmove-right
        ;; windmove-left
        ;; windmove-up
        ;; windmove-down
        ;; windmove-swap-states-right
        ;; windmove-swap-states-left
        ;; windmove-swap-states-up
        ;; windmove-swap-states-down
        ;; tab-new
        ;; tab-close
        ;; tab-next
        org-next-visible-heading
        org-previous-visible-heading
        org-forward-heading-same-level
        org-backward-heading-same-level
        outline-backward-same-level
        outline-forward-same-level
        outline-next-visible-heading
        outline-previous-visible-heading
        outline-up-heading))

(setq pulsar-pulse-on-window-change t)
(setq pulsar-pulse t)
(setq pulsar-delay 0.055)
(setq pulsar-iterations 10)
(setq pulsar-face 'pulsar-magenta)
(setq pulsar-highlight-face 'pulsar-yellow)

(pulsar-global-mode 1)

;; or use the local mode for select mode hooks

(dolist (hook '(org-mode-hook emacs-lisp-mode-hook))
  (add-hook hook #'pulsar-mode))

;; pulsar does not define any key bindings.  this is just a sample that
;; respects the key binding conventions.  evaluate:
;;
;;     (info "(elisp) key binding conventions")
;;
;; the author uses c-x l for `pulsar-pulse-line' and c-x l for
;; `pulsar-highlight-line'.
;;
;; you can replace `pulsar-highlight-line' with the command
;; `pulsar-highlight-dwim'.
(let ((map global-map))
  (define-key map (kbd "C-c h p") #'pulsar-pulse-line)
  (define-key map (kbd "C-c h h") #'pulsar-highlight-line))

(provide '95-pulsar)

;;; 95-pulsar.el ends here
