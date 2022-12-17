;;; 55-pdftools.el --- initializing pdf-tools

;;; Commentary:
;; pdf-tools configuration
;;

;;; Code:

(use-package pdf-tools
  :pin manual
  :init (pdf-tools-install)

  :general
  (pdf-view-mode-map
   "j"   #'image-next-line
   "k"   #'image-previous-line
   "l"   #'image-forward-hscroll
   "h"   #'image-backward-hscroll
   "G"   #'pdf-view-last-page
   "g"   #'nil
   "gg"  #'pdf-view-first-page
   "C-s" #'isearch-forward
   "T"   #'pdf-annot-add-text-annotation
   "D"   #'pdf-annot-delete
   "t"   #'pdf-annot-add-highlight-markup-annotation)

  :config
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
  :custom
  (yas-minor-mode nil)
  (pdf-cache-image-limit 32)
  (pdf-view-max-image-width 2048)
  (pdf-view-resize-factor 1.8)
  (pdf-isearch-batch-mode t)
  (pdf-annot-activate-created-annotations t))

(provide '50-pdftools)
;;; 50-pdftools.el ends here
