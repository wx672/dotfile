;;; init-ox.el --- ox (org export) related initial configurations

;;; Commentary:

;;; Code:

;; https://github.com/hick/emacs-chinese#%E4%B8%AD%E6%96%87%E6%96%AD%E8%A1%8C
;; (defun eh-org-clean-space (text backend info)
;;   "在export为HTML时,删除中文之间不必要的空格"
;;   (when (org-export-derived-backend-p backend 'html)
;;     (let ((regexp "[[:multibyte:]]")
;;           (string text))
;;       ;; org默认将一个换行符转换为空格,但中文不需要这个空格,删除.
;;       (setq string
;;             (replace-regexp-in-string
;;              (format "\\(%s\\) *\n *\\(%s\\)" regexp regexp)
;;              "\\1\\2" string))
;;       ;; 删除粗体之前的空格
;;       (setq string
;;             (replace-regexp-in-string
;;              (format "\\(%s\\) +\\(<\\)" regexp)
;;              "\\1\\2" string))
;;       ;; 删除粗体之后的空格
;;       (setq string
;;             (replace-regexp-in-string
;;              (format "\\(>\\) +\\(%s\\)" regexp)
;;              "\\1\\2" string))
;;       string)))
;; (add-to-list 'org-export-filter-paragraph-functions
;;              'eh-org-clean-space)

(use-package ox-md)

(use-package ox-html
  :config
  (setq org-html-link-org-files-as-html nil
   		org-export-with-sub-superscripts t
		org-html-doctype "html5"
		org-html-head "<link rel=\"stylesheet\" href=\"https://cs6.swfu.edu.cn/org.css\" type=\"text/css\">"
		org-export-default-language "cn"
		org-html-head-include-default-style nil))

(use-package ox-latex
  :config
  (setq
   org-latex-default-packages-alist nil
   org-latex-packages-alist '(("" "hyperref" nil)
							  ("" "amsmath,amsfonts,amssymb" nil)
							  ("" "graphicx" nil)
							  ("" "tabularray" nil)
							  ("" "minted" nil) 
							  ) 
   org-latex-classes
   '(("wx672ctexart"
	  "\\documentclass{wx672ctexart} [PACKAGES] [EXTRA]"
	  ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
	  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	  ("\\paragraph{%s}" . "\\paragraph*{%s}")
	  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	 ("ctexart"
	  "\\documentclass{ctexart} [PACKAGES] [EXTRA]"
	  ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
	  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	  ("\\paragraph{%s}" . "\\paragraph*{%s}")
	  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	 ("article"
	  "\\documentclass{article} [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
	  ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
	  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	  ("\\paragraph{%s}" . "\\paragraph*{%s}")
	  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	 ("report" "\\documentclass{report} [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
	  ("\\part{%s}" . "\\part*{%s}")
	  ("\\chapter{%s}" . "\\chapter*{%s}")
	  ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
	  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	 ("book" "\\documentclass{book} [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
	  ("\\part{%s}" . "\\part*{%s}")
	  ("\\chapter{%s}" . "\\chapter*{%s}")
	  ("\\section{%s}" . "\\section*{%s}")
	  ("\\subsection{%s}" . "\\subsection*{%s}")
	  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
   org-latex-image-default-width ".5\\linewidth"
   org-latex-listings 'minted
   org-latex-minted-options
   '(("mathescape" "true") ("linenos" "true") ("numbersep" "5pt") ("frame" "lines") ("framesep" "2mm"))
   org-latex-pdf-process
   '("lualatex --shell-escape --8bit --interaction nonstopmode --output-directory %o %f"
	 "lualatex --shell-escape --8bit --interaction nonstopmode --output-directory %o %f"
	 "lualatex --shell-escape --8bit --interaction nonstopmode --output-directory %o %f")))

(provide 'init-ox)
;;; init-ox.el ends here
