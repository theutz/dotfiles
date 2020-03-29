;;; core-load-paths.el -- Utz Core File
;;
;;; Commentary:
;;
;; Locate the Bootstraps.
;;
;;; Code:

(defun add-to-load-path (dir)
  "Add DIR to Emacs' load path."
  (add-to-list 'load-path dir))

;; Paths
(defvar utz-start-directory
  user-emacs-directory
  "Emacs start directory.")

(defvar utz-core-directory
  (expand-file-name "core/" utz-start-directory)
  "Files and functions that form the backbone of the config.")

(defvar utz-config-file
  (expand-file-name "config.el" utz-start-directory)
  "Configurable variables used throughout my setup.")

(defvar utz-custom-file
  (expand-file-name "custom.el" utz-start-directory)
  "File for customize interface settings.")

;; Load Paths
(mapc 'add-to-load-path
      (list
	utz-core-directory
	(concat utz-core-directory "libs/")
	(concat utz-core-directory "libs/utz-theme/")
	))

;; Themes
(add-to-list 'custom-theme-load-path (concat utz-core-directory
					     "libs/utz-theme/"))

;;; core-load-paths.el ends here
