;;; init-31-org.el --- Code for initializing org-mode

;;; Commentary:
;; Runs org-mode along with some custom configuration files
;;
;; More information can be found at:
;;    http://doc.norang.ca/org-mode.html

;;; Code:

(use-package org
  :init
  (setq
   org-modules '(org-bibtex org-info org-jsinfo)
   org-log-done (quote time)
   org-reverse-note-order t
   org-deadline-warning-days 14
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
   
   org-list-demote-modify-bullet '(("+" . "-")
								   ("*" . "-")
								   ("1." . "-")
								   ("1)" . "-"))
   
   ;; Showing context
   org-show-hierarchy-above '((default . t))
   org-show-following-heading '((default . t))
   org-show-siblings '((default . t))
   
   diary-file "~/.diary.org"
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

  :bind (("C-c a" . org-agenda)
		 ("C-c b" . org-iswitchb)
		 :map org-mode-map
		 ("C-c l" . org-store-link)
		 ("C-c >" . org-time-stamp-inactive)
		 ("C-<return>" . delete-other-windows))

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
  
  (use-package org-agenda
    :init
    (setq
     org-agenda-files nil
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
     org-agenda-diary-file "~/.diary.org"))
  
  (use-package org-clock
    :init
    (setq
     org-clock-into-drawer "CLOCK"
     org-clock-persist t
     org-clock-in-switch-to-state "STARTED")) ;; Change task state to STARTED when clocking in
  
  (use-package org-chinese-utils
    :init
    (ocus-enable)
	:config
	(setq ocus-enabled-utils
		  '(clean-headline-space clean-paragraph-space align-babel-table show-babel-image)))

  (use-package org-pdfview
	:init (pdf-tools-install)
	:bind (:map pdf-view-mode-map
				("j" . image-next-line)
				("k" . image-previous-line)
				("l" . image-forward-hscroll)
				("h" . image-backward-hscroll)
				("G" . pdf-view-last-page)
				("g" . nil)
				("gg" . pdf-view-first-page)
				("C-c C-c" . image-toggle-display))

	:config
	(setq pdf-view-continuous t)
	(add-to-list 'org-file-apps '("\\.pdf\\'" . org-pdfview-open))
	(add-to-list 'org-file-apps '("\\.pdf::\\([[:digit:]]+\\)\\'" . org-pdfview-open))
	(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))

  (use-package org-capture
	:bind (:map global-map ("C-c c" . org-capture))
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
	   ("w" "org-protocol" entry (file org-default-notes-file)
		"* TODO Review %c\n%U\n  %i" :immediate-finish t)
	   ;; ("p" "Phone call" entry (file "~/.refile.org")
	   ;;  "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
	   ("h" "Habit" entry (file org-default-notes-file)
		"* NEXT %?\n%U\n%a\nSCHEDULED: %t .+1d/3d\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n  %i"))

	 org-refile-targets '((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))
	 org-refile-use-outline-path (quote file)
	 org-outline-path-complete-in-steps t
	 org-refile-allow-creating-parent-nodes (quote confirm)))

  (use-package org-ref
	:diminish org-ref
	:bind (:map org-ref-cite-keymap
				("C-c r s" . org-ref-sort-citation-link)
				("C-c r f" . org-ref-get-bibtex-key-and-file)
				("C-c r h" . org-ref-cite-hydra/body)
				("C-c r c" . org-ref-open-citation-at-point))
	:init
	(setq reftex-default-bibliography
		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
		  org-ref-default-bibliography
		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
		  org-ref-bibliography-notes "~/Documents/bib/notes.org"
		  ;; org-ref-pdf-directory "~/Documents/bib/bibtex-pdfs/"
		  bibtex-completion-bibliography
		  '("~/Documents/bib/os.bib" "~/Documents/bib/net.bib" "~/Documents/bib/wikipedia.bib")
		  ;; bibtex-completion-library-path "~/Documents/bib/bibtex-pdfs"
		  bibtex-completion-notes-path "~/Documents/bib/helm-bibtex-notes"
		  bibtex-completion-pdf-open-function 'org-open-file))
  );end of (use-package org)

(load "init-ox")

(provide 'init-31-org)

;;; init-31-org.el ends here
