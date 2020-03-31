;;; utz-keybindings.el -- My Keybindings
;;
;;; Commentary:
;;
;; Doing it right.
;;
;;; Code:

(require 'utz-evil)
(require 'utz-general)

(general-define-key
 "s-q" '(save-buffers-kill-terminal :wk "Kill Client"))

(utz/set-leader-key
  "SPC" '(helm-M-x :wk "M-x")
  "0" '(ranger :wk "Ranger")
  "/" '(helm-ag :wk "Search"))

(utz/set-leader-key :infix "."
  "" '(:ignore t :wk "Toggles")
  "f" '(toggle-frame-maximized :wk "Frame Fullscreen")
  "F" '(toggle-frame-maximized :wk "Frame Maximized"))

(utz/set-leader-key :infix "c"
  "" '(:ignore t :wk "Customize")
  "g" '(customize-group-other-window :wk "Group")
  "c" '(customize :wk "All")
  "t" '(customize-themes :wk "Themes")
  "f" '(customize-face-other-window :wk "Face")
  "v" '(customize-variable-other-window :wk "Variable"))

(utz/set-leader-key :infix "b"
  "" '(:ignore t :wk "Buffer")
  "b" '(helm-buffers-list :wk "List Buffers")
  "d" '(evil-delete-buffer :wk "Delete Buffer")
  "p" '(previous-buffer :wk "Previous Buffer")
  "n" '(next-buffer :wk "Next Buffer")
  "r" '(revert-buffer :wk "Revert Buffer")
  "e" '(eval-buffer :wk "Eval Buffer"))

(utz/set-leader-key :infix "e"
  "" '(:ignore t :wk "Eval / Errors")
  "b" '(eval-buffer :wk "Buffer")
  "e" '(eval-last-sexp :wk "Last Sexp")
  "l" '(flycheck-list-errors :wk "List Errors")
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
  "c" '(utz/edit-custom-file :wk "Edit Custom File")
  "d" '(utz/edit-configuration :wk "Edit Configuration")
  "f" '(utz/edit-custom-functions :wk "Edit Custom Functions")
  "k" '(utz/edit-keybindings :wk "Edit Keybindings"))

(utz/set-leader-key :infix "g"
  "" '(:ignore t :wk "Git")
  "s" '(magit-status :wk "Git Status")
  "d" '(magit-dispatch :wk "Git Dispatch")
  "a" '(magit-stage :wk "Stage File"))

(utz/set-leader-key :infix "h"
  "" '(:ignore t :wk "Help")
  "f" '(helpful-callable :wk "Helpful Callable")
  "F" '(helpful-function :wk "Helpful Function")
  "v" '(helpful-variable :wk "Helpful Variable")
  "k" '(helpful-key :wk "Helpful Key")
  "x" '(helpful-at-point :wk "Helpful at Point")
  "c" '(helpful-command :wk "Helpful Command"))

(utz/set-leader-key :infix "o"
  "" '(:ignore t :wk "Org")
  "a" '(org-agenda :wk "Agenda"))

(utz/set-leader-key :infix "q"
  "" '(:ignore t :wk "Quit / Restart")
  "Q" '(save-buffers-kill-emacs :wk "Kill Client and Server")
  "q" '(save-buffers-kill-terminal :wk "Kill Client")
  "R" '(restart-emacs :wk "Restart Emacs"))

(utz/set-leader-key :infix "w"
  "" '(:ignore t :wk "Window")
  "c" '(evil-window-delete :wk "Delete")
  "=" '(balance-windows :wk "Balance")
  "h" '(evil-window-left :wk "Left")
  "j" '(evil-window-down :wk "Down")
  "k" '(evil-window-up :wk "Up")
  "l" '(evil-window-right :wk "Right")
  "H" '(evil-window-move-far-left :wk "Left")
  "J" '(evil-window-move-very-down :wk "Down")
  "K" '(evil-window-move-very-up :wk "Up")
  "L" '(evil-window-move-far-right :wk "Right")
  "o" '(delete-other-windows :wk "Delete Others")
  "v" '(evil-window-vsplit :wk "Vertical Split")
  "s" '(evil-window-split :wk "Horizontal Split")
  "f" '(make-frame :wk "Make Frame"))

(utz/set-localleader-key
  :states '(normal insert visual emacs)
  :keymaps '(org-mode-map)
  "SPC" '(org-todo :wk "Cycle State")
  "l" '(:ignore t :wk "Links")
  "l i" '(org-insert-link :wk "Insert")
  "l t" '(org-toggle-link-display :wk "Toggle Link Display")
  "l o" '(org-open-at-point :wk "Open at Point")
  "s" '(:ignore t :wk "State")
  "s t" '(org-todo :wk "Cycle State"))

(provide 'utz-keybindings)

;;; utz-keybindings.el ends here
