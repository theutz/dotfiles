;;; utz-keybindings.el -- My Keybindings
;;
;;; Commentary:
;;
;; Doing it right.
;;
;;; Code:

(require 'utz-general)

(utz/set-leader-key
  "SPC" '(helm-M-x :wk "M-x")
  "0" '(ranger :wk "Ranger"))

(utz/set-leader-key :infix "b"
  "" '(:ignore t :wk "Buffer")
  "b" '(helm-buffers-list :wk "List Buffers")
  "p" '(previous-buffer :wk "Previous Buffer")
  "n" '(next-buffer :wk "Next Buffer")
  "r" '(revert-buffer :wk "Revert Buffer")
  "e" '(eval-buffer :wk "Eval Buffer"))

(utz/set-leader-key :infix "e"
  "" '(:ignore t :wk "Eval")
  "b" '(eval-buffer :wk "Buffer")
  "e" '(eval-last-sexp :wk "Last Sexp")
  "r" '(eval-region :wk "Region")
  "x" '(eval-expression :wk "Expression")
  "d" '(eval-defun :wk "Defun"))

(utz/set-leader-key :infix "f"
  "" '(:ignore t :wk "Files")
  "r" '(revert-buffer :wk "Revert Buffer")
  "s" '(save-buffer :wk "Save Buffer")
  "f" '(helm-find-files :wk "Find Files"))

(utz/set-leader-key :infix "f e"
  "" '(:ignore t :wk "Emacs")
  "r" '(utz/reload-configuration :wk "Reload Configuration")
  "d" '(utz/edit-configuration :wk "Edit Configuration")
  "f" '(utz/edit-custom-functions :wk "Edit Custom Functions")
  "k" '(utz/edit-keybindings :wk "Edit Keybindings"))

(utz/set-leader-key :infix "g"
  "" '(:ignore t :wk "Git")
  "s" '(magit-status :wk "Git Status")
  "d" '(magit-dispatch :wk "Git Dispatch")
  "a" '(magit-stage :wk "Stage File"))

(utz/set-leader-key :infix "q"
  "" '(:ignore t :wk "Quit / Restart")
  "Q" '(save-buffers-kill-emacs :wk "Kill Client and Server")
  "q" '(save-buffers-kill-terminal :wk "Kill Client")
  "R" '(restart-emacs :wk "Restart Emacs"))

(provide 'utz-keybindings)

;;; utz-keybindings.el ends here
