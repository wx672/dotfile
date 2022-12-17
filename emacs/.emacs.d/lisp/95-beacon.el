;;; 95-beacon.el --- initializing beacon

;;; Commentary:
;; https://github.com/Malabarba/beacon

;;; code:

(use-package beacon
  :config
  (progn
    (setq beacon-blink-when-point-moves-vertically nil ; default nil
		  beacon-blink-when-point-moves-horizontally nil ; default nil
		  beacon-blink-when-buffer-changes t ; default t
		  beacon-blink-when-window-scrolls t ; default t
		  beacon-blink-when-window-changes t ; default t
		  beacon-blink-when-focused nil ; default nil
		  beacon-blink-duration 0.3 ; default 0.3
		  beacon-blink-delay 0.3 ; default 0.3
		  beacon-size 20 ; default 40
		  beacon-color "violet" ; default 0.5
		  )

    (add-to-list 'beacon-dont-blink-major-modes 'term-mode)

    (beacon-mode 1)))


(provide '95-beacon)

;;; 95-beacon.el ends here
