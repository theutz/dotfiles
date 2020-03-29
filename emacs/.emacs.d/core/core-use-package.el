;;; core-use-package.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Setup use-package.el for package configuration
;;
;;; Code:

(defun utz//setup-use-package ()
  (straight-use-package 'use-package)
  (require 'use-package)
  (setq straight-use-package-by-default t))

(provide 'core-use-package)

;;; core-use-package.el ends here.
