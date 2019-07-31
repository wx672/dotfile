;;; init-globalkeys.el --- global key mappings

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-<return>") 'delete-other-windows)
(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
(global-set-key (kbd "<print>") 'ps-print-region-with-faces)
(global-set-key [f1] 'query-replace-regexp)
(global-set-key [M-f1] 'menu-bar-mode)
;; (global-set-key [M-f2] 'mode-line-hide)
;; (global-set-key [M-S-f2] 'mode-line-show)
(global-set-key [f5] 'shell-other-window)
(global-set-key [f6] 'hexl-mode)
(global-set-key [C-f6] 'hexl-find-file)
(global-set-key [f9] 'switch-to-other-buffer)
(global-set-key [S-f11] 'next-user-buffer)
(global-set-key [f11] 'previous-user-buffer)
(global-set-key [C-tab] 'next-user-buffer)
(global-set-key [C-iso-lefttab] 'previous-user-buffer)
(global-set-key (kbd "M-n") 'next-user-buffer)
(global-set-key (kbd "M-p") 'previous-user-buffer)
(global-set-key [f12] 'kill-current-buffer)
(global-set-key [C-f12] 'kill-current-buffer-and-window)
(global-set-key (kbd "C-x f") 'find-file-at-point)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x |") 'split-window-right)

;; (defvar-local hidden-mode-line-mode nil)

;; (define-minor-mode hidden-mode-line-mode
;;   "Minor mode to hide the mode-line in the current buffer."
;;   :init-value nil
;;   :global t
;;   :variable hidden-mode-line-mode
;;   :group 'editing-basics
;;   (if hidden-mode-line-mode
;;       (setq hide-mode-line mode-line-format
;;             mode-line-format nil)
;;     (setq mode-line-format hide-mode-line
;;           hide-mode-line nil))
;;   (force-mode-line-update)
;;   ;; Apparently force-mode-line-update is not always enough to
;;   ;; redisplay the mode-line
;;   (redraw-display)
;;   (when (and (called-interactively-p 'interactive)
;;              hidden-mode-line-mode)
;;     (run-with-idle-timer
;;      0 nil 'message
;;      (concat "Hidden Mode Line Mode enabled.  "
;;              "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; If you want to hide the mode-line in every buffer by default
;; (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

(defun user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html"
  (interactive)
  (if (or
	   (string-match-p "^\*" (buffer-name))
	   (string-equal (substring (buffer-name) -3) ".gz")
	   (string-equal major-mode "dired-mode"))
	  nil
	t))

(defun next-user-buffer ()
  "Switch to the next user buffer."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun previous-user-buffer ()
  "Switch to the previous user buffer."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(global-set-key [remap next-buffer] 'next-user-buffer)
(global-set-key [remap previous-buffer] 'previous-user-buffer)

(defun mode-line-hide ()
  "Toggle mode line."
  (interactive)
  (setq-default mode-line-format nil)
  )

(defun shell-other-window ()
  "Launch a shell in a new window."
  (interactive)
  (split-window nil 12 nil)
  (eshell))

(defun switch-to-other-buffer ()
  "Switch to last buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun kill-current-buffer ()
  "Kill the current buffer (prompting if it is modified)."
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill-current-buffer-and-window ()
  "Kill the current buffer (prompting if it is modified) and its window."
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window))

;; provide some dired goodies and dired-jump at C-x C-j
(load "dired-x")

(provide 'init-globalkeys)
;;; init-globalkeys.el ends here
