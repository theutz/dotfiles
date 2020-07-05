;;;; general-init.el -- Setup `general.el'

;;; Commentary:
;;
;; We use the general for all our keybindings.
;;

;;; Code:

(require 'straight-init)
(require 'utz-macros)

;; Import the package

(use-package general
  :demand t
  :init
  (declare-function general-define-key "general")
  (declare-function general--simulate-keys "general")
  :functions (general-simulate-C-h
	      general-simulate-C-w
	      general-simulate-s-l))

;; Setup leader definers

(general-create-definer utz/set-leader-key
  :prefix "SPC"
  :keymaps '(normal emacs visual))

(utz/set-leader-key "" '(:ignore t :wk "Leader"))

(utz/create-leader-definer "q" "Quit")
(utz/create-leader-definer "b" "Buffer")
(utz/create-leader-definer "f" "Files")
(utz/create-leader-definer "f c" "Configuration")
(utz/create-leader-definer "F" "Frames")
(utz/create-leader-definer "g" "Git")
(utz/create-leader-definer "l" "Language")
(utz/create-leader-definer "o" "Org")
(utz/create-leader-definer "o a" "Agenda")
(utz/create-leader-definer "o r" "Rifle")
(utz/create-leader-definer "p" "Project")
(utz/create-leader-definer "w" "Window")

;; Setup Localleader Definers

(general-create-definer utz/set-localleader-key
  :prefix ","
  :non-normal-prefix "M-,")

(provide 'general-init)

;;; general-init.el ends here
