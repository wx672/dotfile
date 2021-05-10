;; -*- lisp -*-

(in-package :stumpwm)

;; Start swank
;; (require :swank)
;; (swank-loader:init)
;; (swank:create-server :port 4444
;;                      :style swank:*communication-style*
;;                      :dont-close t)

;; Basics
(set-prefix-key (kbd "s-z"))
;; (setf *startup-message* NIL
;;       *suppress-abort-messages* t
;;       *shell-program* (getenv "SHELL"))

;; (defvar *message-filters* '("Group dumped")
;;   "Don't show these messages.")

;; (defun message (fmt &rest args)
;;   "Overwritten message function to allow filters"
;;   (let ((msg-string (apply 'format nil fmt args)))
;;     (unless (member msg-string *message-filters* :test #'string=)
;;       (echo-string (current-screen) msg-string))))

(set-module-dir
 (pathname-as-directory (concat (getenv "HOME") "/src/stumpwm-contrib")))

;; Modules
;; (ql:quickload "clx-truetype")
(load-module "ttf-fonts")
;; (load-module "globalwindows")
;; (load-module "amixer")
;; (load-module "swm-gaps")
(load-module "kbd-layouts")
;; (load-module "command-history")

;; (setf kbd-layouts:*caps-lock-behavior* :ctrl)
;; (kbd-layouts:keyboard-layout-list "us" "in -variant hin-wx")

;; (setf swm-gaps:*inner-gaps-size* 10
;;       swm-gaps:*outer-gaps-size* 10
;;       swm-gaps:*head-gaps-size* 10)
(xft:cache-fonts)
;; Looks
(set-font (make-instance 'xft:font
                         :family "FiraCode Nerd Font"
                         :subfamily "Regular"
                         :size 18))
;; (set-font "-windows-dina-medium-r-normal--13-100-96-96-c-80-iso8859-1")

(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *message-window-padding* 10
      *maxsize-border-width* 5
      *normal-border-width* 5
      *transient-border-width* 2
      stumpwm::*float-window-border* 2
      stumpwm::*float-window-title-height* 5
      *mouse-focus-policy* :click)

(set-normal-gravity :center)
(set-maxsize-gravity :center)
(set-transient-gravity :center)

(set-fg-color "#eeeeee")
(set-bg-color "#1C2028")
(set-border-color "#232731")
(set-focus-color "#3B4252")
(set-unfocus-color "#232731")
(set-win-bg-color "#22272F")
(set-float-focus-color "#3B4252")
(set-float-unfocus-color "#232731")

(setf *colors* (list "#1C2028"      ; 0 black
                     "#BF616A"      ; 1 red
                     "#A3BE8C"      ; 2 green
                     "#EBCB8B"      ; 3 yellow
                     "#5E81AC"      ; 4 blue
                     "#B48EAD"      ; 5 magenta
                     "#8FBCBB"      ; 6 cyan
                     "#ECEFF4"))    ; 7 white

;; (defun shift-windows-forward (frames win)
;;   "Exchange windows through cycling frames."
;;   (when frames
;;     (let ((frame (car frames)))
;;       (shift-windows-forward (cdr frames)
;;                              (stumpwm::frame-window frame))
;;       (when win
;;         (stumpwm::pull-window win frame)))))

;; Command
(defcommand qutebrowser () ()
  (run-or-raise "qutebrowser" '(:class "qutebrowser")))

(defcommand xterm () ()
  (run-or-raise "x-terminal-emulator --class xterm" '(:class "xterm")))

(defcommand emacs () ()
  (run-or-raise "emacsclient -c -n" '(:class "Emacs")))

;; (defcommand rotate-windows () ()
;;   (let* ((frames (stumpwm::head-frames (current-group) (current-head)))
;;          (win (stumpwm::frame-window (car (last frames)))))
;;     (shift-windows-forward frames win)))

(defcommand windows-left-right () ()
  "Open windows side by side"
  (run-commands "only" "vsplit"))

(defcommand windows-up-down () ()
  "Open windows up and down"
  (run-commands "only" "hsplit"))

;; (defcommand raise-brightness () ()
;;   (run-shell-command "light -A 5"))

;; (defcommand lower-brightness () ()
;;   (run-shell-command "light -U 5"))

;; (amixer::defvolcontrol amixer-Master-5- "Master" "5%-")
;; (amixer::defvolcontrol amixer-Master-5+ "Master" "5%+")

;; (defun executable-find (name)
;;   "Tell if given executable is present in PATH."
;;   (let ((which-out (string-trim '(#\  #\linefeed) (run-shell-command (concat "which " name) t))))
;;     (unless (string-equal "" which-out) which-out)))

;; (defun slop-get-pos ()
;;   (mapcar #'parse-integer (ppcre:split "[^0-9]" (run-shell-command "slop -f \"%x %y %w %h\"" t))))

;; (defun slop-or-float ()
;;   "Slop the current window or just float if slop cli not present."
;;   (if (executable-find "slop")
;;       (let ((window (current-window))
;;             (pos (slop-get-pos)))
;;         (float-window window (current-group))
;;         (float-window-move-resize window
;;                                   :x (nth 0 pos)
;;                                   :y (nth 1 pos)
;;                                   :width (nth 2 pos)
;;                                   :height (nth 3 pos)))
;;       (run-commands "float-this")))

;; (defcommand slop-this () () (slop-or-float))

;; (defmacro define-keyboard-macro (name keys)
;;   '(defcommand ,name () ()
;;      (loop for k in (mapcar #'parse-key ,keys)
;;            do (send-fake-key (current-window) k))))

;; (defcommand scr () ()
;;   (let ((selection (car (stumpwm:select-from-menu (current-screen) (list "rectangle" "window" "screen") "Screenshot: "))))
;;     (run-shell-command (concat "scr " selection))))

;; All the keys

(setf *root-map* (make-sparse-keymap))

;; (define-key *top-map* (kbd "s-j") "next-in-frame")
;; (define-key *top-map* (kbd "s-k") "previous-in-frame") 
;; (define-key *top-map* (kbd "s-o") "other-in-frame") 
(define-key *top-map* (kbd "s-j") "next") 
(define-key *top-map* (kbd "s-o") "other")
(define-key *top-map* (kbd "s-1") "only");frame
(define-key *top-map* (kbd "s-2") "windows-left-right");frame
(define-key *top-map* (kbd "s-3") "windows-up-down");frame
(define-key *top-map* (kbd "s-t") "xterm")

;; (define-key *top-map* (stumpwm:kbd "s-d") "exec")

;;;;
;; 

;; (defvar *toggle-map* (make-sparse-keymap))
;; (define-key *root-map* (kbd "t") '*toggle-map*)
;; (define-key *toggle-map* (kbd "g") "toggle-gaps")
;; (define-key *toggle-map* (kbd "f") "slop-this")
;; (define-key *toggle-map* (kbd "u") "unfloat-this")
;; (define-key *toggle-map* (kbd "a") "toggle-always-show")
;; (define-key *toggle-map* (kbd "t") "toggle-always-on-top")

;; (define-key *top-map* (kbd "s-r") "rotate-windows")
;; (define-key *top-map* (kbd "s-v") "windows-left-right")
;; (define-key *top-map* (kbd "s-h") "windows-up-down")
;; (define-key *top-map* (kbd "s-f") "only")
;; (define-key *top-map* (kbd "s-c") "fclear")
;; (define-key *top-map* (kbd "s-s") "scr")

;; (define-key *top-map* (kbd "XF86MonBrightnessUp") "raise-brightness")
;; (define-key *top-map* (kbd "XF86MonBrightnessDown") "lower-brightness")

;; (define-key *top-map* (kbd "XF86AudioLowerVolume") "amixer-Master-5-")
;; (define-key *top-map* (kbd "XF86AudioRaiseVolume") "amixer-Master-5+")
;; (define-key *top-map* (kbd "XF86AudioMute") "amixer-Master-toggle")

;; (define-key *root-map* (kbd "C-c") "run-or-raise-terminal")
;; (define-key *root-map* (kbd "C-v") "run-or-raise-browser")
;; (define-key *root-map* (kbd "!") "run-shell-command")
;; (define-key *root-map* (kbd "b") "windowlist")
;; (define-key *root-map* (kbd "q") "refresh-stuff")
;; (define-key *root-map* (kbd "TAB") "pull-hidden-other")

;; (define-key *groups-map* (kbd "Right") "gnext")
;; (define-key *groups-map* (kbd "Left") "gprev")
;; (define-key *groups-map* (kbd "M-Right") "gnext-with-window")
;; (define-key *groups-map* (kbd "M-Left") "gprev-with-window")
;; (define-key *groups-map* (kbd "b") "global-windowlist")

