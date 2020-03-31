;;; utz-keybindings.el -- My Keybindings
;;
;;; Commentary:
;;
;; Doing it right.
;;
;;; Code:

(require 'general)
(require 'evil)
(require 'evil-surround)
(require 'evil-collection)
(require 'evil-commentary)
(require 'evil-magit)
(require 'evil-org)
(require 'evil-org-agenda)

;; Evil

(setq evil-normal-state-tag "NORMAL"
      evil-visual-state-tag "VISUAL"
      evil-insert-state-tag "INSERT"
      evil-emacs-state-tag "EMACS"
      evil-replace-state-tag "REPLACE"
      evil-motion-state-tag "MOTION"
      evil-operator-state-tag "OPERATOR")

(evil-mode 1)
(global-evil-surround-mode 1)
(evil-collection-init)
(evil-commentary-mode)

(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'evil-org-mode-hook '(lambda ()
				 (evil-org-set-key-theme)))
(evil-org-agenda-set-keys)

;; Definers

(general-create-definer utz/set-leader-key
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  :states '(normal visual insert emacs))

(general-create-definer utz/set-localleader-key
  :prefix ","
  :non-normal-prefix "M-,"
  :states '(normal visual emacs))

(general-create-definer utz/set-help-key
  :prefix "C-h")

(general-create-definer utz/set-window-key
  :prefix "C-w")

;; Keybindings

(general-define-key
 "M-x" 'helm-M-x
 "s-q" '(save-buffers-kill-terminal :wk "Kill Client"))

(general-define-key
 :states 'normal
 :keymaps 'helpful-mode-map
 "q" '(evil-window-delete :wk "Delete Window"))

;; Leader Keybindings

(utz/set-leader-key
  "SPC" '(helm-M-x :wk "M-x")
  "0" '(ranger :wk "Ranger")
  "/" '(helm-ag :wk "Search"))

(utz/set-leader-key :infix "."
  "" '(:ignore t :wk "Toggles")
  "f" '(toggle-frame-maximized :wk "Frame Fullscreen")
  "F" '(toggle-frame-maximized :wk "Frame Maximized"))

(utz/set-leader-key :infix "b"
  "" '(:ignore t :wk "Buffer")
  "b" '(helm-buffers-list :wk "List Buffers")
  "d" '(evil-delete-buffer :wk "Delete Buffer")
  "p" '(previous-buffer :wk "Previous Buffer")
  "n" '(next-buffer :wk "Next Buffer")
  "r" '(revert-buffer :wk "Revert Buffer")
  "e" '(eval-buffer :wk "Eval Buffer"))

(utz/set-leader-key :infix "c"
  "" '(:ignore t :wk "Customize")
  "g" '(customize-group-other-window :wk "Group")
  "c" '(customize :wk "All")
  "t" '(customize-themes :wk "Themes")
  "f" '(customize-face-other-window :wk "Face")
  "v" '(customize-variable-other-window :wk "Variable"))

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
  "S" '(evil-write-all :wk "Save All")
  "f" '(helm-find-files :wk "Find Files")
  "F" '(find-file-other-window :wk "Find Files Other Window"))

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
  "a" '(apropos :wk "Apropos")
  "e" '(view-echo-area-messages :wk "View Echo Area Messages")
  "f" '(helpful-callable :wk "Helpful Callable")
  "F" '(helpful-function :wk "Helpful Function")
  "v" '(helpful-variable :wk "Helpful Variable")
  "o" '(helpful-symbol :wk "Helpful Symbol")
  "m" '(describe-mode :wk "Describe Mode")
  "p" '(describe-text-properties :wk "Describe Text Properties")
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
  "m" '(maximize-window :wk "Maximize")
  "o" '(delete-other-windows :wk "Delete Others")
  "v" '(evil-window-vsplit :wk "Vertical Split")
  "s" '(evil-window-split :wk "Horizontal Split")
  "f" '(make-frame :wk "Make Frame"))

;; Local Leader Keybindings

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
