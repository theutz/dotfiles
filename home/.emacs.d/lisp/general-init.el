;;;; general-init.el -- Setup `general.el'

;;; Commentary:
;;
;; We use the general for all our keybindings.
;;

;;; Code:

(require 'straight-init)

(use-package general
  :demand t
  :init
  (declare-function general-define-key "general")
  (declare-function general--simulate-keys "general")
  :functions (general-simulate-C-h
	      general-simulate-C-w
	      general-simulate-s-l)
  :config
  )

(general-create-definer utz/set-leader-key
  :prefix "SPC"
  :keymaps '(normal emacs visual))

(general-create-definer utz/set-localleader-key
  :prefix ","
  :non-normal-prefix "M-,")

(provide 'general-init)

;;; general-init.el ends here
