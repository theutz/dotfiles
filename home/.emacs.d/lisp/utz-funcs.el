;;;; utz-funcs.el -- Function over form.

;;; Commentary:
;;
;; These should prove useful later on.
;;

;;; Code:

(require 'utz-vars)
(require 'utz-macros)

(utz/find-config-file "emacs" "e" utz-config-file)

(utz/find-config-file "emacs-custom" "," utz-custom-file)

(utz/find-config-file "emacs-init" "i" utz-init-file)

(utz/find-config-file "skhd" "s" (expand-file-name "home/.config/skhd/skhdrc" utz-dotfiles-dir))

(utz/find-config-file "yabai" "y" (expand-file-name "home/.config/yabai/yabairc" utz-dotfiles-dir))

(utz/find-config-file "zshrc" "z" (expand-file-name "~/.zshrc"))

(defun utz/load-config-file (arg)
   "(Re)load Emacs with a fresh configuration file.

ARG specifies `universal-argument' usage."
   (interactive "P")
   (cond ((equal '(4) arg) (load-file utz-init-file))
	 (t (org-babel-load-file utz-config-file))))

(defun utz/delete-frame ()
  "Delete the selected frame."
  (interactive)
  (condition-case nil (delete-frame) (error (save-buffers-kill-terminal))))

(provide 'utz-funcs)

;;; utz-funcs.el ends here
