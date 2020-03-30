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

(defun utz//get-available-themes ()
  "Get an alphabetically sorted list of available themes."
  (sort (custom-available-themes) #'string<))

(defun utz//get-current-theme-index ()
  "Get the index of the currently enabled theme from the sorted list."
  (seq-position (utz//get-available-themes) (car custom-enabled-themes)))

(defun utz//get-theme-by-offset-from-current (offset)
  "Get a different theme by providing OFFSET from the current index."
  (seq-elt (utz//get-available-themes) (+
					(or (utz//get-current-theme-index) 0)
					offset)))

;;;###autoload
(defun utz/next-theme ()
  "Load the next theme."
  (interactive)
    (load-theme (utz//get-theme-by-offset-from-current 1))
    (utz/display-current-theme))

;;;###autoload
(defun utz/prev-theme ()
  "Load the previous theme."
  (interactive)
    (load-theme (utz//get-theme-by-offset-from-current -1))
    (utz/display-current-theme))

;;;###autoload
(defun utz/display-current-theme ()
  "Echo the name of the current theme in the minibuffer."
  (interactive)
  (message (symbol-name (car custom-enabled-themes))))

(provide 'utz-funcs)

;;; utz-funcs.el ends here
