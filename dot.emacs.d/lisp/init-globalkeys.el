;;; init-globalkeys.el --- global key mappings

;;; Commentary:

;;; Code:
;(global-set-key (kbd "C-h") 'delete-backward-char)
;(global-set-key [M-f1] 'help-command)
(global-set-key (kbd "C-<return>") 'delete-other-windows)
(global-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
(global-set-key (kbd "<print>") 'ps-print-region-with-faces)
(global-set-key [f1] 'query-replace-regexp)
(global-set-key [f2] 'hs-toggle-hiding)
(global-set-key [f5] 'shell-other-window)
;(global-set-key [f6] 'hexl-mode)
;(global-set-key [C-f6] 'hexl-find-file)
(global-set-key [f9] 'switch-to-other-buffer)
(global-set-key [f11] 'previous-user-buffer)
(global-set-key (kbd "M-n") 'next-user-buffer)
(global-set-key (kbd "M-p") 'previous-user-buffer)
(global-set-key [f12] 'kill-current-buffer)
(global-set-key (kbd "C-x f") 'find-file-at-point)
(global-set-key (kbd "C-x C-o") 'browse-url-at-point)
(global-set-key (kbd "C-x -") 'split-window-below)
(global-set-key (kbd "C-x |") 'split-window-right)

(add-hook 'prog-mode-hook #'hs-minor-mode)

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
