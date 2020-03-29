;;; init.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Bootstrap the system.
;;
;;; Code:

(load (concat (file-name-directory load-file-name)
	      "core/core-load-paths.el")
      nil (not init-file-debug))

(require 'core-utz)
(utz//init)

;;; init.el ends here.
