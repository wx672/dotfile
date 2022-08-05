;;; 31-org.el --- Code for initializing org-mode

;;; Commentary:
;; Runs org-mode along with some custom configuration files
;;
;; More information can be found at:
;;    http://doc.norang.ca/org-mode.html

;;; Code:

(use-package org
  :init
  (setq
;;   org-catch-invisible-edits show-and-error
   org-modules '(ol-bibtex ol-info ol-docview)
   org-log-done 'time
   org-reverse-note-order t
   org-deadline-warning-days 7
   org-hide-block-startup t
   org-hide-leading-stars t
   org-use-fast-todo-selection t
   org-use-fast-tag-selection 'auto
   org-fast-tag-selection-single-key t
   org-special-ctrl-a/e t
   org-special-ctrl-k t
   org-M-RET-may-split-line nil
   org-time-clocksum-format "%02d:%02d"
   org-read-date-prefer-future nil
   org-log-into-drawer "LOGBOOK"
   org-completion-use-ido t
   org-tags-exclude-from-inheritance nil
   org-goto-interface 'outline-path-completion
   org-cycle-separator-lines 0
   org-cycle-include-plain-lists t
   org-blank-before-new-entry '((heading) (plain-list-item))
   org-src-fontify-natively t
   org-confirm-babel-evaluate nil
   org-ditaa-jar-path "/usr/bin/ditaa"
   org-time-stamp-custom-formats '("<%m/%d/%y>" . "<%m/%d/%y>")
   
   org-list-demote-modify-bullet '(("+" . "-") ("*" . "-") ("1." . "-") ("1)" . "-"))
   
   ;; Showing context
   org-show-hierarchy-above '((default . t))
   org-show-following-heading '((default . t))
   org-show-siblings '((default . t))
   
   diary-file "~/.cache/emacs/var/Diary.org"
   calendar-mark-diary-entries-flag t
   calendar-view-diary-initially-flag t
   
   ;; TODO keywords
   org-todo-keywords
   '((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
     (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)"))

   org-todo-state-tags-triggers
   '(("CANCELLED" ("CANCELLED" . t))
     ("WAITING" ("WAITING" . t) ("NEXT"))
     ("SOMEDAY" ("WAITING" . t))
     (done ("NEXT") ("WAITING"))
     ("TODO" ("WAITING") ("CANCELLED"))
     ("STARTED" ("WAITING"))
     ("PROJECT" ("CANCELLED") ("PROJECT" . t)))
   
   org-file-apps '((auto-mode . emacs)
				   ("\\.x?html?\\'" . default)
				   ("\\.pdf\\'" . "/usr/bin/zathura %s")))

  :general
  (org-mode-map
   "C-c l" #'org-store-link
   "C-c >" #'org-time-stamp-inactive)

  :config
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'yas-minor-mode-on)

  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

  (load "org-protocol")

  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((awk . t)
	 (calc . t)
	 (css . t)
	 (ditaa . t)
	 (dot . t)
	 (emacs-lisp . t)
	 (latex . t)
	 (org . t)
	 (python . t)
	 (R . t)
	 (sed . t)
	 (shell . t)
	 ))
  
  (use-package org-capture
	:config
	(setq
	 org-directory "~/"
	 org-default-notes-file (concat org-directory ".tmp.org")

	 org-capture-templates
	 '(("e" "Error" entry (file "~/Errorlog.org")
		"* ERROR %?\n%U\n%a\n  %i")
	   ("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
		"* TODO %?\n%U\n%a\n  %i" :clock-in t :clock-resume t)
	   ("n" "Note" entry (file org-default-notes-file)
		"* %? :NOTE:\n%U\n%a\n  %i")
	   ("i" "Idea" entry (file org-default-notes-file)
		"* %? :IDEA:\n%U\n%a\n  %i")
	   ("j" "Journal" entry (file+datetree org-default-notes-file)
		"* %?\n%U\n  %i")
	   ("r" "Reminder" entry (file+headline org-default-notes-file "Reminder")
		"* %i%? \n %U")
	   ("w" "org-protocol" entry (file org-default-notes-file)
		"* TODO Review %c\n%U\n  %i" :immediate-finish t)
	   ("h" "Habit" entry (file org-default-notes-file)
		"* NEXT %?\n%U\n%a\nSCHEDULED: %t .+1d/3d\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n  %i"))

	 ;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
	 ;; https://www.reddit.com/r/emacs/comments/4366f9/how_do_orgrefiletargets_work/
	 org-refile-targets '((org-agenda-files :maxlevel . 3))
	 org-refile-use-outline-path 'file
	 org-outline-path-complete-in-steps nil
	 org-refile-allow-creating-parent-nodes (quote confirm)))

  (use-package org-agenda
    :init
    (setq
     org-agenda-window-setup 'current-window
     org-agenda-restore-windows-after-quit nil
     org-agenda-span 1
     org-agenda-skip-deadline-if-done t
     org-agenda-skip-scheduled-if-done t
     org-agenda-show-all-dates t
     org-agenda-start-on-weekday 1
     org-agenda-todo-ignore-with-date t
     org-stuck-projects '("LEVEL=2+project/-DONE" ("NEXT" "PENDING") ("single") "")
     org-agenda-include-diary t
     org-agenda-diary-file "~/.cache/emacs/var/Diary.org"))
  
  (use-package org-clock
    :init
    (setq
     org-clock-into-drawer "CLOCK"
     org-clock-persist t
     org-clock-in-switch-to-state "STARTED"))

  (use-package org-timer
	:config
	(setq org-timer-default-timer 25)

	(add-hook 'org-clock-in-hook
			  (lambda ()
				(if (not org-timer-current-timer)
					(org-timer-set-timer '(16))))))	
  
;;  (use-package org-chinese-utils
;;    :init
;;    (ocus-enable)
;;	:config
;;	(setq ocus-enabled-utils
;;		  '(clean-headline-space clean-paragraph-space align-babel-table show-babel-image)))

;; https://github.com/fuxialexander/org-pdftools
(use-package org-noter
  :config
  ;; Your org-noter config ........
  (require 'org-noter-pdftools))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

;; https://github.com/yilkalargaw/org-auto-tangle
(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
)

;; https://github.com/integral-dw/org-superstar-mode
(use-package org-superstar
  :config
  (setq
   inhibit-compacting-font-caches t
   org-hide-emphasis-markers t
   )
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  )

  ;; (use-package org-pdftools
  ;; 	:init (pdf-tools-install)

  ;; 	:config
  ;; 	(setq pdf-view-continuous t)
  ;; 	(add-to-list 'org-file-apps '("\\.pdf\\'" . org-pdfview-open))
  ;; 	(add-to-list 'org-file-apps '("\\.pdf::\\([[:digit:]]+\\)\\'" . org-pdfview-open))
  ;; 	(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))

  ;; (use-package org-ref
  ;; 	:diminish org-ref

  ;; 	:init
  ;; 	(setq reftex-default-bibliography
  ;; 		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
  ;; 		  org-ref-default-bibliography
  ;; 		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
  ;; 		  org-ref-bibliography-notes "~/Documents/bib/notes.org"
  ;; 		  ;; org-ref-pdf-directory "~/Documents/bib/bibtex-pdfs/"
  ;; 		  bibtex-completion-bibliography
  ;; 		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
  ;; 		  ;; bibtex-completion-library-path "~/Documents/bib/bibtex-pdfs"
  ;; 		  bibtex-completion-notes-path "~/Documents/bib/helm-bibtex-notes"
  ;; 		  bibtex-completion-pdf-open-function 'org-open-file))

  ;; :general
  ;; (org-ref-cite-keymap
  ;;  "C-c rs" #'org-ref-sort-citation-link
  ;;  "C-c rf" #'org-ref-get-bibtex-key-and-file
  ;;  "C-c rh" #'org-ref-cite-hydra/body
  ;;  "C-c rc" #'org-ref-open-citation-at-point)

  );end of (use-package org)

(load "init-ox")

(provide '31-org)

;;; 31-org.el ends here
