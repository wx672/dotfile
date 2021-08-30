;;; init-60-dict.el --- initializing dict

;;; Commentary:
;; dict configuration
;;

;;; Code:

(use-package dict
  :custom
  (dict-original-server "localhost")
  (dict-servers '("localhost"))
  ;; (dictionary-server "localhost")
  (dict-databases
   '("wn" "gcide" "foldoc" "jargon" "moby-tresaurus" "vera" "langdao-ce" "langdao-ec"))
  (dict-enable-key-bindings t)
  (dict-noauth t)
  (dict-show-one-window t)

  (dict-update-key-bindings)
  (dict-mode-update-key-bindings))

(provide 'init-60-dict)

;;; init-60-dict.el ends here
