;;; init-beamer.el --- for latex beamer

;;; Commentary:

;;; Code:

(require 'tex)
(require 'latex)

(TeX-add-style-hook "beamer"
 (function
  (lambda ()
    (defvar beamer-use-section-labels-flag nil
      "Controls whether section labels are added")
    (unless beamer-use-section-labels-flag
      (make-local-variable 'LaTeX-section-hook)
      (setq LaTeX-section-hook
             '(LaTeX-section-heading
               LaTeX-section-title
               LaTeX-section-section)))

    (setq LaTeX-item-list
          (append '(("itemize" . LaTeX-item-beamer)
                    ("enumerate" . LaTeX-item-beamer))
                  LaTeX-item-list))

    (TeX-add-symbols
     '("alert" 1)
     '("alt" TeX-arg-beamer-overlay-spec 2)
     '("beamerbutton" 1)
     '("beamergotobutton" 1)
     '("beamerreturnbutton" 1)
     '("beamerskipbutton" 1)
     '("frame" TeX-arg-beamer-frametitle)
     '("frametitle" 1)
     '("hyperlink" TeX-arg-beamer-overlay-spec 2)
     '("hyperlinkslideprev" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkslidenext" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkframestart" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkframeend" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkframestartnext" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkframeendprev" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkpresentationstart" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkpresentationend" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkappendixstart" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkappendixend" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkdocumentstart" TeX-arg-beamer-overlay-spec 1)
     '("hyperlinkdocumentend" TeX-arg-beamer-overlay-spec 1)
     '("hypertarget" TeX-arg-beamer-overlay-spec 2)
     '("institute" 1)
     '("invisible" TeX-arg-beamer-overlay-spec 1)
     '("label" TeX-arg-beamer-overlay-spec 1)
     '("logo" 1)
     '("note" TeX-arg-beamer-note 1)
     '("only" TeX-arg-beamer-overlay-spec 1)
     '("onslide" TeX-arg-beamer-overlay-spec)
     '("partpage")
     '("pause")
     '("structure" TeX-arg-beamer-overlay-spec 1)
     '("temporal" TeX-arg-beamer-overlay-spec 3)
     '("titlepage")
     '("titlegraphic" 1)
     '("uncover" TeX-arg-beamer-overlay-spec 1)
     '("visible" TeX-arg-beamer-overlay-spec 1)
     ))))

(defun TeX-arg-beamer-overlay-spec (optional &optional prompt)
  "Prompt for overlay specification." 
  (let ((overlay (read-string "Overlay: ")))
    (if (not (zerop (length overlay)))
        (progn (insert "<" overlay ">")))
    (indent-according-to-mode)))

(defun TeX-arg-beamer-frametitle (optional &optional prompt)
  "Prompt for the frametitle."
  (let ((title (read-string "What title: ")))
    (if (not (zerop (length title)))
        (progn (insert TeX-grop TeX-esc "frametitle" TeX-grop 
                       title TeX-grcl TeX-grcl))
      (progn (insert TeX-grop TeX-grcl)))))

(defun LaTeX-item-beamer ()
  "Insert a new item with an optional overlay argument."
  (TeX-insert-macro "item")
  (delete-horizontal-space)
  (TeX-arg-beamer-overlay-spec 0)
  (insert " ")
  (indent-according-to-mode))
  
(defun TeX-arg-beamer-note (optional &optional prompt)
  "Prompt for overlay specification and optional argument."
  (let ((overlay (read-string "Overlay: "))
        (options (read-string "Options: ")))
    (if (not (zerop (length overlay)))
        (progn (insert "<" overlay ">")))
    (if (not (zerop (length options)))
        (progn (insert "[" options "]")))
    (indent-according-to-mode)))

(provide 'init-beamer)
;;; init-beamer.el ends here
