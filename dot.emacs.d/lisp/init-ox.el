;;; init-ox.el --- ox (org export) related initial configurations

;;; Commentary:

;;; Code:

;; https://github.com/hick/emacs-chinese#%E4%B8%AD%E6%96%87%E6%96%AD%E8%A1%8C
(use-package ox
  :ensure org
  :config
  (defun clear-single-linebreak-in-cjk-string (string)
    "Clear single line-break (STRING) between cjk characters that is usually soft line-breaks."
    (let* ((regexp "\\([\u4E00-\u9FA5]\\)\n\\([\u4E00-\u9FA5]\\)")
		   (start (string-match regexp string)))
      (while start
		(setq string (replace-match "\\1\\2" nil nil string)
			  start (string-match regexp string start))))
    string)

  (defun ox-html-clear-single-linebreak-for-cjk (string backend info)
	"STRING.  BACKEND.  INFO."
	;; (when (org-export-derived-backend-p backend 'html)
	;; 	(clear-single-linebreak-in-cjk-string string))
	(clear-single-linebreak-in-cjk-string string))
  
  (add-to-list 'org-export-filter-final-output-functions
			   'ox-html-clear-single-linebreak-for-cjk)

  (use-package ox-html
	:ensure org
	:init
	(setq
	 org-html-link-org-files-as-html nil
	 org-export-with-sub-superscripts t
	 org-html-doctype "html5"
	 org-html-head "<link rel=\"stylesheet\" href=\"https://cs2.swfu.edu.cn/org-info-js/org-manual.css\" type=\"text/css\">"
	 org-html-head-extra "<style>code {font-family:Monospace; font-size:90%; background-color: #eee} body {font-size:14pt}</style>"
	 org-export-default-language "cn"
	 org-html-head-include-default-style nil))

(use-package ox-latex
	:config
	(setq
	 ;; org-latex-default-packages-alist nil
	 org-latex-packages-alist '(("" "wx672hyperref" nil))
	 org-latex-classes
	 '(("wx672ctexart"
		"\\documentclass{wx672ctexart}
\\usepackage[top=1in, bottom=1in, left=1.25in, right=1in]{geometry}
		[NO-DEFAULT-PACKAGES]
		[PACKAGES]
		[EXTRA]"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	   ("article"
		"\\documentclass{article}
		[NO-DEFAULT-PACKAGES]
		[PACKAGES]
		[EXTRA]"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		("\\paragraph{%s}" . "\\paragraph*{%s}")
		("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	   ("report" "\\documentclass{report}
		[NO-DEFAULT-PACKAGES]
		[PACKAGES]
		[EXTRA]"
		("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	   ("book" "\\documentclass{book}
		[NO-DEFAULT-PACKAGES]
		[PACKAGES]
		[EXTRA]"
		("\\part{%s}" . "\\part*{%s}")
		("\\chapter{%s}" . "\\chapter*{%s}")
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}")
		("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
	 ; org-latex-default-figure-position "!htb"
	 ; org-latex-default-table-environment "tabular"
	 org-latex-image-default-width ".6\\linewidth"
	 org-latex-listings 'minted
	 org-latex-minted-options
	 '(("mathescape" "true")
	   ("linenos" "true")
	   ("numbersep" "5pt")
	   ("frame" "lines")
	   ("framesep" "2mm"))
	 org-latex-pdf-process
	 '("xelatex --shell-escape -interaction nonstopmode -output-directory %o %f"
	   "xelatex --shell-escape -interaction nonstopmode -output-directory %o %f"
	   "xelatex --shell-escape -interaction nonstopmode -output-directory %o %f")))
  )
  

(provide 'init-ox)
;;; init-ox.el ends here
