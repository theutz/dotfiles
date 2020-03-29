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
  "Utz start directory")

(defvar utz-core-directory
  (expand-file-name (concat utz-start-directory "core/")))

;; Load Paths
(mapc 'add-to-load-path
      `(
	,utz-core-directory
	,(concat utz-core-directory "libs/")
	,(concat utz-core-directory "libs/utz-theme/")
	))

;; Themes
(add-to-list 'custom-theme-load-path (concat utz-core-directory
					     "libs/utz-theme/"))

;;; core-load-paths.el ends here
