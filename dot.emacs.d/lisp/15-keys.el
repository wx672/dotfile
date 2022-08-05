;;; 15-keys.el --- key mappings

;;; Commentary:
;; https://github.com/noctuid/general.el
;; https://config.daviwil.com/emacs
;; https://www.reddit.com/r/emacs/comments/ogiiyp/in_2021_what_is_the_state_of_the_art_in_emacs

;;; Code:

(use-package general
  :config
  ;; (general-evil-setup t)
  ;; (general-auto-unbind-keys)

  (general-def
	;; "M-x"        #'helm-M-x
	;; "M-y"        #'helm-show-kill-ring
	;; "C-."        #'helm-imenu-anywhere
	"C-<return>" #'delete-other-windows
	"<print>"    #'ps-print-region-with-faces
    "<f1>"       #'query-replace-regexp
    "<f2>"       #'hs-toggle-hiding
    "<f5>"       #'shell-other-window
	"C-o"        #'other-window
    "M-o"        #'switch-to-other-buffer
	"M-<backspace>" #'kill-this-buffer
	"C-<backspace>" #'backward-kill-word
	"M-j"        #'next-user-buffer
	"M-k"        #'previous-user-buffer
	"M-n"        #'next-buffer
	"M-p"        #'previous-buffer
	"M-l"        #'consult-buffer;fzf-switch-buffer
	"M-C-/"      #'company-complet
	"C-S-n"      #'forward-paragraph
	"C-S-p"      #'backward-paragraph
	); end general-def
  
  ;; (general-create-definer wx672/ctrl-x-keys
  ;;   :prefix "C-x")

  (general-def
	:prefix "C-x"
	"f"   #'find-file-at-point
	"rf"  #'save-current-file-to-register
	"C-o" #'browse-url-at-point
	"-"   #'split-window-below
	"|"   #'split-window-right
	"\\"  #'split-window-right
	"M-s" #'screenshot-svg
	)

  ;; (general-create-definer wx672/ctrl-c-keys
  ;;   :prefix "C-c")

  (general-def
	:prefix "C-c"
	"a" #'org-agenda
	"b" #'org-iswitchb
	"c" #'org-capture
	)

  (general-def dired-mode-map
	"h" #'dired-up-directory
	"l" #'dired-find-file
	"j" #'dired-next-line
	"k" #'dired-previous-line
	"J" #'dired-goto-file
	"SPC" #'dired-goto-file
	"f" #'dired-goto-file
	"H" #'dired-omit-mode
	)

  (general-unbind Info-mode-map
	"M-n" nil
	)
  );end of use-package general

(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

;; https://www.reddit.com/r/emacs/comments/oui4c6/using_register_to_save_current_file/
(defun save-current-file-to-register ()
  "Save current file to register."
  (interactive)
  (let ((reg (register-read-with-preview "Save current file to register: ")))
    (set-register reg `(file . ,(buffer-file-name)))))

(defun screenshot-svg ()
  "Save a screenshot of the current frame as an SVG image.
Saves to a temp file and puts the filename in the kill ring."
  (interactive)
  (let* ((filename (format-time-string "/tmp/%Y-%m-%d-%H-%M-%S.svg"))
         (data (x-export-frames nil 'svg)))
    (with-temp-file filename
      (insert data))
    (kill-new filename)
    (message filename)))

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

;;(global-set-key [remap next-buffer] 'next-user-buffer)
;;(global-set-key [remap previous-buffer] 'previous-user-buffer)

(defun mode-line-hide ()
  "Toggle mode line."
  (interactive)
  (setq-default mode-line-format nil)
  )

(defun shell-other-window ()
  "Launch a shell in a new window."
  (interactive)
  (split-window nil 12 nil)
  (vterm))

(defun switch-to-other-buffer ()
  "Switch to last buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun kill-current-buffer ()
  "Kill the current buffer (prompting if it is modified)."
  (interactive)
  (kill-buffer (current-buffer)))

;; provide some dired goodies and dired-jump at C-x C-j
(load "dired-x")

(provide '15-keys)
;;; 15-keys.el ends here
