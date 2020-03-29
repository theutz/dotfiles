;;; init.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Bootstrap the system.
;;
;;; Code:

;; Setup Customize
(setq custom-file
      (expand-file-name "custom.el"
			user-emacs-directory))
(load-file custom-file)

;; Setup Load Path
(add-to-list 'load-path (expand-file-name "utz"
					  user-emacs-directory))

(require 'utz-basics)

;;; init.el ends here.
