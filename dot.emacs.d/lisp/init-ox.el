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

  ;; https://github.com/yjwen/org-reveal/blob/master/Readme.org
;  (use-package ox-reveal)

  (use-package ox-html
	:ensure org
	:init
	(setq
	 org-export-with-sub-superscripts t
	 org-html-doctype "html5"
	 org-html-head "<link rel=\"stylesheet\" href=\"https://cs2.swfu.edu.cn/org-info-js/org-manual.css\" type=\"text/css\">"
	 org-html-head-extra "<style>code {font-family:Monospace; font-size:90%; background-color: #eee} body {font-size:14pt}</style>"
	 org-export-default-language "cn"
	 org-html-head-include-default-style nil
	 )))
  

(provide 'init-ox)
;;; init-ox.el ends here
