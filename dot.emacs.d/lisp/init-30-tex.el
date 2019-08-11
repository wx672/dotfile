;;; init-30-tex.el --- Code for LaTeX editing

;;; Commentary:

;;; Code:

(use-package tex
  :ensure auctex
  :init
  (setq
   TeX-PDF-mode t
   TeX-engine 'xetex
   TeX-command-default "LaTeXMK"
   latex-run-command "LaTeXMK"
   LaTeX-command "LaTeXMK"
   TeX-auto-save t
   TeX-parse-self t
   TeX-newline-function 'delete-other-windows

   TeX-command-list
   '(("LaTeXMK" "latexmk %s" TeX-run-TeX nil t :help "Run latexmk")
     ("XeLaTeX" "%`xelatex%(mode) -synctex=1 --shell-escape%' %t" TeX-run-TeX nil t :help "Run xelatex")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     )

   LaTeX-verbatim-environments '("verbatim" "verbatim*" "Verbatim" "Verbatim*" "lstlisting" "code" "minted" "gascode" "ccode" "pythoncode" "javacode" "bashcode")
   
   TeX-view-program-selection '((output-pdf "PDF Tools") (output-html "xdg-open"))
   TeX-view-style nil
   bibtex-maintain-sorted-entries t
   bibtex-align-at-equal-sign t
   ) ; end of setq

  :config
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "LaTeXMK")))
  (add-hook 'LaTeX-mode-hook '(lambda () (setq TeX-command-default "LaTeXMK")))

  (setq-default TeX-master nil)

  ;; (use-package auctex-latexmk
  ;;   :config
  ;;   (auctex-latexmk-setup)
  ;;   )
  
  (use-package latex
    :bind (:map LaTeX-mode-map ("$" . self-insert-command))
    :config
    (use-package outline
      :config
      (add-hook 'LaTeX-mode-hook (lambda () (outline-minor-mode 1)))
      (setq outline-minor-mode-prefix "\C-c\C-o")
      :bind (:map LaTeX-mode-map
		  ("C-c C-n" . outline-next-visible-heading)
		  ("C-c C-p C-p" . outline-previous-visible-heading))
      )
    )
  
  (use-package reftex
    :init
    (setq
     reftex-plug-into-AUCTeX t
     reftex-bibliography-commands '("addbibresource" "bibliography" "nobibliography")
	 bibtex-dialect 'biblatex
	 reftex-use-external-file-finders t
     )
    :config
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    )
  
  (use-package tex-fold
    :init
    (setq
     TeX-fold-env-spec-list
     '(("[frame]" ("frame"))
       ("[block]" ("block"))
       ("[comment]" ("comment"))
       ("[tikzpicture]" ("tikzpicture"))
       ("[minted]" ("minted"))
       ("[listing]" ("lstlisting"))
       ("[example]" ("example" "exampleblock"))
       ("[columns]" ("columns")))
     )
    :config (add-hook 'TeX-mode-hook (lambda () (TeX-fold-mode 1)))
    )
  ) ;end of (use-pakcage tex)

(load "init-beamer")

(provide 'init-30-tex)
;;; init-30-tex.el ends here
