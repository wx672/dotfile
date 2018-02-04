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
(global-set-key [f10] 'next-user-buffer)
(global-set-key [f11] 'previous-user-buffer)
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

;http://stackoverflow.com/questions/14323516/make-emacs-next-buffer-skip-messages-buffer
(defun next-user-buffer ()
  "Skip non-user buffers."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (next-buffer)
    (while
		(and
		 (string-match-p "^\*" (buffer-name))
		 ;; (equal "*synctex.gz" (buffer-name))
		 (not (equal bread-crumb (buffer-name))))
      (next-buffer))))

(global-set-key [remap next-buffer] 'next-user-buffer)

(defun previous-user-buffer ()
  "Skip non-user buffers."
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (previous-buffer)
    (while
		(and
		 (string-match-p "^\*" (buffer-name))
		 ;; (equal "*synctex.gz" (buffer-name))
		 (not (equal bread-crumb (buffer-name))))
      (previous-buffer))))

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
