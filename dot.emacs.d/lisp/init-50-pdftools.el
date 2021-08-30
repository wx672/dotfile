;;; init-55-pdftools.el --- initializing pdf-tools

;;; Commentary:
;; pdf-tools configuration
;;

;;; Code:

(use-package pdf-tools
  :pin manual
  :init (pdf-tools-install)
  :bind (:map pdf-view-mode-map
	      ("T" . pdf-annot-add-text-annotation)
	      ("D" . pdf-annot-delete)
	      ("t" . pdf-annot-add-highlight-markup-annotation)
	      ("j" . image-next-line)
	      ("k" . image-previous-line)
	      ("l" . image-forward-hscroll)
	      ("h" . image-backward-hscroll)
	      ("G" . pdf-view-last-page)
	      ("g" . nil)
	      ("gg" . pdf-view-first-page)
	      ("C-c C-c" . image-toggle-display)
	      ("C-s" . isearch-forward))
  :config
  (setq-default pdf-view-display-size 'fit-page)
  :custom
  (yas-minor-mode nil)
  (pdf-cache-image-limit 32)
  (pdf-view-max-image-width 2048)
  (pdf-view-resize-factor 1.8)
  (pdf-isearch-batch-mode t)
  (pdf-annot-activate-created-annotations t))

(provide 'init-50-pdftools)

;;; init-50-pdftools.el ends here
