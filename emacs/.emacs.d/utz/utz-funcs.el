;;; utz-funcs.el -- Custom Functions
;;
;;; Commentary:
;;
;; Look what I can do.
;;
;;; Code:

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
(defun utz/edit-custom-functions ()
  "Edit the custom functions file."
  (interactive)
  (find-file (expand-file-name "utz-funcs.el"
			       (expand-file-name "utz" user-emacs-directory))))

(provide 'utz-funcs)

;;; utz-funcs.el ends here
