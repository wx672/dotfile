;;; 25-citar.el --- citar

;;; Commentary:
;; https://github.com/emacs-citar/citar

;;; Code:

(use-package citar
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom  
  (citar-bibliography
   '("~/lecture_notes/bib/net.bib"
	 "~/lecture_notes/bib/os.bib"
	 "~/lecture_notes/bib/rfc.bib")))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

;; (use-package citar
;;   :no-require
;;   :custom
;;   (org-cite-global-bibliography '("~/bib/references.bib"))
;;   (org-cite-insert-processor 'citar)
;;   (org-cite-follow-processor 'citar)
;;   (org-cite-activate-processor 'citar)
;;   (citar-bibliography org-cite-global-bibliography)
;;   ;; optional: org-cite-insert is also bound to C-c C-x C-@
;;   :bind
;;   (:map org-mode-map :package org ("C-c b" . #'org-cite-insert)))

(setq citar-at-point-function 'embark-act)

;; (setq citar-symbols
;;       `((file ,(all-the-icons-faicon 
;; 				"file-o" 
;; 				:face 'all-the-icons-green
;; 				:v-adjust -0.1) . " ")
;;         (note ,(all-the-icons-material
;; 				"speaker_notes" 
;; 				:face 'all-the-icons-blue
;; 				:v-adjust -0.3) . " ")
;;         (link ,(all-the-icons-octicon
;; 				"link"
;; 				:face 'all-the-icons-orange
;; 				:v-adjust 0.01) . " ")
;; 		))

;; (setq citar-symbol-separator "  ")

(provide '25-citar)
;;; 25-citar.el ends here
