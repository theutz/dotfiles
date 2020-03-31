;;; utz-funcs.el -- Custom Functions
;;
;;; Commentary:
;;
;; Look what I can do.
;;
;;; Code:

(require 'cl-lib)
(require 'utz-basics)

;;;###autoload
(defun utz/reload-configuration ()
  "Reload my custom configuration."
  (interactive)
  (load-file utz-configuration-file))

;;;###autoload
(defun utz/edit-configuration ()
  "Edit the main configuration file."
  (interactive)
  (find-file utz-configuration-file))

;;;###autoload
(defun utz/edit-keybindings ()
  "Edit the keybindings file."
  (interactive)
  (find-file (expand-file-name "utz-keybindings.el"
			       (expand-file-name "utz" user-emacs-directory))))

;;;###autoload
(defun utz/edit-custom-file ()
  "Manually edit settings from customize."
  (interactive)
  (find-file custom-file))

;;;###autoload
(defun utz/edit-custom-functions ()
  "Edit the custom functions file."
  (interactive)
  (find-file (expand-file-name "utz-funcs.el"
			       (expand-file-name "utz" user-emacs-directory))))

;;;###autoload
(cl-defun utz/view-readme (repo-name &key (file-name "README.md") full-path)
  "View the readme file from the repository downloaded by =straight.el=."
  (interactive (let* ((repo-name (read-directory-name "Repository Name: " utz-packages-directory))
		      (full-path (read-file-name "File Name: " repo-name "README.md")))
		 (list repo-name :file-name nil :full-path full-path)))
  (find-file-read-only-other-window
   (or full-path
       (expand-file-name (or file-name
			     "README.md")
			 (expand-file-name repo-name
					   utz-packages-directory)))))

(defun utz/setup-emoji-font (frame)
  "Use Apple emojis inline.  FRAME is passed to 'set-fontset-font'."
  (when (eq system-type 'darwin)
    (set-fontset-font t
		      'symbol
		      (font-spec :family "Apple Color Emoji")
		      frame
		      'prepend)))

(provide 'utz-funcs)

;;; utz-funcs.el ends here
