;; -*- lisp -*-

(in-package :stumpwm)

;; https://www.emacswiki.org/emacs/StumpWM (complicate with sbcl)
;; Load swank.
;; "*prefix-key* ; swank" will kick this off
;; (load "/usr/share/common-lisp/source/slime/swank-loader.lisp")
;; (swank-loader:init)
;; (ql:quickload :swank)
;; (defcommand swank () ()
;;   (swank:create-server :port 4005
;;                        :style swank:*communication-style*
;;                        :dont-close t)
;;   (echo-string (current-screen) 
;; 	           "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm)."))
;; (swank)

;; Basics

(set-font "12x24")

(set-normal-gravity :bottom)

(setf
 *message-window-gravity* :bottom
 *input-window-gravity* :bottom-left
 *run-or-raise-all-groups* nil
 *run-or-raise-all-screens* nil
)

;; Window operations

;; (defcommand toggle-layout () ()
;; 	    "cycle through hsplit, vsplit, and only. 
;; don't know how to define isVsplit/isHsplit"
;; 	    (if (sibling)
;; 		(if (?isVsplit) (hsplit) (vsplit))
;; 		(if (sibling) (hsplit) (vsplit)))
;; 	    )

(defcommand toggle-hsplit () ()
            "toggle between hsplit and only"
            (if (sibling) (only) (hsplit)))

(defcommand toggle-vsplit () ()
            "toggle between vsplit and only"
            (if (sibling) (only) (vsplit)))

;; (defcommand windows-other-only () ()
;;             "maximize other window (<C-x 0> in emacs)"
;;             (if (sibling) (run-commands "other" "only") (other-window)))

;; (defcommand fother-pull-from-windowlist () ()
;;   "fnext; pull-from-windowlist"
;;   (run-commands "fother" "pull-from-windowlist"))

(defcommand shrink-right () ()
			"resize 1880 1080"
			(run-commands "only" "hsplit" "fselect 1" "resize 1880 1080"))			

(defcommand group-two () ()
            "move window to group two"
            (run-commands "gnewbg two" "gmove two"))

;; (defcommand floating () ()
;;             "make a window floating."
;;             (run-commands "gnewbg-float floating" "gmove floating" "gselect floating"))

;; (defcommand unfloating () ()
;;             "make a window unfloating."
;;             (run-commands "gmove Default" "gselect Default"))

;; Apps

(defcommand qutebrowser () ()
  (run-or-raise "qutebrowser" '(:class "qutebrowser")))

(defcommand xterm () ()
  (run-or-raise "x-terminal-emulator --class Alacritty,Xterm" '(:class "Xterm")))

(defcommand tmate () ()
  (run-shell-command "x-terminal-emulator -e tmate"))

(defcommand emacs () ()
  (run-or-raise "emacsclient -c -n" '(:class "Emacs")))

(defcommand screenshot () ()
  (run-shell-command "import -window root /tmp/screenshot-$(date +%Y%m%d%H%M).png"))

(defcommand cheatsheet () ()
  (run-shell-command "timeout 1m sxiv -sf -bq ~/.keys-stumpwm.png"))

(defcommand wemux () ()
  (run-shell-command "x-terminal-emulator -e /usr/local/bin/stud"))

(defcommand ffclient () ()
  (run-shell-command "/usr/local/bin/ffclient"))

;; audio
(defcommand audiomute () ()
  (run-shell-command "amixer set Master toggle"))

(defcommand audiodown () ()
  (run-shell-command "amixer set Master 3%-"))

(defcommand audioup () ()
  (run-shell-command "amixer set Master 3%+"))

;; brightness
(defcommand brightnessup () ()
  (run-shell-command "brightnessctl set +2%"))

(defcommand brightnessdown () ()
  (run-shell-command "brightnessctl set 2%-"))

(set-prefix-key (kbd "s-T"))

;; (setf *root-map* (make-sparse-keymap))

;; *top-map*: keybindings that don't use the prefex key
(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-ESC") "run-shell-command")
(define-key *top-map* (kbd "s-C-r") "loadrc")
(define-key *top-map* (kbd "s-C-l") "shrink-right")
(define-key *top-map* (kbd "s-C-DEL") "fullscreen")
(define-key *top-map* (kbd "s-j") "next") 
(define-key *top-map* (kbd "s-k") "prev")
(define-key *top-map* (kbd "s-TAB") "other") 
(define-key *top-map* (kbd "s-o") "other")
(define-key *top-map* (kbd "s-h") "fnext")
(define-key *top-map* (kbd "s-n") "fnext")
(define-key *top-map* (kbd "s-1") "only")
(define-key *top-map* (kbd "s-0") "remove-split")
(define-key *top-map* (kbd "s--") "vsplit")
(define-key *top-map* (kbd "s-\\")  "toggle-hsplit")
(define-key *top-map* (kbd "s-RET") "only")
(define-key *top-map* (kbd "s-SPC") "only")
(define-key *top-map* (kbd "s-l") "pull-from-windowlist")
(define-key *top-map* (kbd "s-i") "info")
(define-key *top-map* (kbd "s-g") "abort")
(define-key *top-map* (kbd "s-L") "grouplist")
(define-key *top-map* (kbd "s-!") "gmove Default")
(define-key *top-map* (kbd "s-@") "group-two")
;;(define-key *top-map* (kbd "s-f") "floating")
(define-key *top-map* (kbd "s-.") "gnext")
(define-key *top-map* (kbd "s-e") "emacs")
(define-key *top-map* (kbd "s-q") "qutebrowser")
(define-key *top-map* (kbd "s-t") "xterm")
(define-key *top-map* (kbd "s-C-p") "screenshot")
(define-key *top-map* (kbd "s-F1") "cheatsheet")
(define-key *top-map* (kbd "s-C-F12") "wemux")
(define-key *top-map* (kbd "s-F12") "tmate")
(define-key *top-map* (kbd "s-F11") "ffclient")
(define-key *top-map* (kbd "XF86AudioMute") "audiomute")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "audiodown")
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "audioup")
(define-key *top-map* (kbd "XF86MonBrightnessUp") "brightnessup")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "brightnessdown")

;; (defvar *toggle-map* (make-sparse-keymap))
;; (define-key *root-map* (kbd "t") '*toggle-map*)
;; (define-key *toggle-map* (kbd "g") "toggle-gaps")
;; (define-key *toggle-map* (kbd "f") "slop-this")
;; (define-key *toggle-map* (kbd "u") "unfloat-this")
;; (define-key *toggle-map* (kbd "a") "toggle-always-show")
;; (define-key *toggle-map* (kbd "t") "toggle-always-on-top")

;; (define-key *top-map* (kbd "s-c") "fclear")

;; (define-key *root-map* (kbd "q") "refresh-stuff")
;; (define-key *root-map* (kbd "TAB") "pull-hidden-other")

;; (define-key *groups-map* (kbd "M-Right") "gnext-with-window")
;; (define-key *groups-map* (kbd "M-Left") "gprev-with-window")

