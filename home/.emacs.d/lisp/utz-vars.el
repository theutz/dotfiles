;;; utz-vars.el -- Setup my user variables

;;; Commentary:
;;
;; Some basic values re-used across much of my config.
;;

;;; Code:

(defconst utz-dotfiles-dir (expand-file-name "~/.dotfiles")
  "Location of my dotfiles repository.")

(defconst utz-emacs-dir (expand-file-name "home/.emacs.d" utz-dotfiles-dir)
  "Location of my actual emacs.d directory, before the symlink.")

(defconst utz-init-file (expand-file-name "init.el" utz-emacs-dir)
  "Location of my actual Emacs init.el., before the symlink.")

(defconst utz-custom-file (expand-file-name "custom.el" utz-emacs-dir)
  "Location of my actual custom file, before the symlink.")

(defconst utz-config-file (expand-file-name "config.org" utz-emacs-dir)
  "Location of my actual config file, before the symlink.")

(defconst utz-config-dir (expand-file-name "lisp" utz-emacs-dir)
  "Location of the scripts that setup Emacs, before the symlink.")

(defconst utz-snippets-directory (expand-file-name "snippets" utz-emacs-dir)
  "Location of my snippets directory, before the symlink.")

(provide 'utz-vars)

;;; utz-vars.el ends here
