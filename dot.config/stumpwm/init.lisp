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
 *input-window-gravity* :bottom-left)

;; Command
(defcommand windows-left-right () ()
  "Open windows side by side"
  (run-commands "only" "hsplit"))

(defcommand windows-up-down () ()
  "Open windows up and down"
  (run-commands "only" "vsplit"))

(defcommand windows-other-only () ()
  "maximize other window"
  (run-commands "other" "only"))

(defcommand qutebrowser () ()
  (run-or-raise "qutebrowser" '(:class "qutebrowser")))

(defcommand xterm () ()
  (run-or-raise "x-terminal-emulator --class xterm" '(:class "xterm")))

(defcommand emacs () ()
  (run-or-raise "emacsclient -c -n" '(:class "Emacs")))

(defcommand screenshot () ()
  (run-shell-command "import -window root /tmp/screenshot-$(date +%Y%m%d%H%M).png"))

;; audio
(defcommand audiomute () ()
  (run-shell-command "amixer set Master toggle && amixer set PCM toggle"))

(defcommand audiodown () ()
  (run-shell-command "amixer set Master 3%- && amixer set PCM 3%-"))

(defcommand audioup () ()
  (run-shell-command "amixer set Master 3%+ && amixer set PCM 3%+"))

;; brightness
(defcommand brightnessup () ()
  (run-shell-command "brightnessctl set +5%"))

(defcommand brightnessdown () ()
  (run-shell-command "brightnessctl set 5%-"))

;;

(gnewbg "two")
;;(gnewbg-float "float")

(set-prefix-key (kbd "s-t"))

;; (setf *root-map* (make-sparse-keymap))

(define-key *top-map* (kbd "s-;") "colon")
(define-key *top-map* (kbd "s-:") "eval")
(define-key *top-map* (kbd "s-ESC") "run-shell-command")
(define-key *top-map* (kbd "s-R") "loadrc") 
(define-key *top-map* (kbd "s-j") "next") 
(define-key *top-map* (kbd "s-k") "prev")
(define-key *top-map* (kbd "s-TAB") "next") 
(define-key *top-map* (kbd "s-o") "other")
(define-key *top-map* (kbd "s-RET") "only")
(define-key *top-map* (kbd "s-1") "only")
(define-key *top-map* (kbd "s-0") "windows-other-only")
(define-key *top-map* (kbd "s-C--") "windows-up-down")
(define-key *top-map* (kbd "s-\\") "windows-left-right")
(define-key *top-map* (kbd "s-e") "emacs")
(define-key *top-map* (kbd "s-l") "pull-from-windowlist")
(define-key *top-map* (kbd "s-L") "grouplist")
(define-key *top-map* (kbd "s-i") "info")
(define-key *top-map* (kbd "s-!") "gmove Default")
(define-key *top-map* (kbd "s-@") "gmove two")
(define-key *top-map* (kbd "s-.") "gnext")
(define-key *top-map* (kbd "s-P") "screenshot")
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

