;;;; straight-init.el -- Setup straight.el

;;; Commentary:
;;
;; Bootstrap straight.el and set it's basic options.
;;

;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
	(expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	  'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Must be defined before requiring straight

(setq straight-use-package-by-default t)

;; Actually require straight.el and use-package

(require 'straight)
(straight-use-package 'use-package)
(require 'use-package)

;; provide this module

(provide 'straight-init)

;;; Local Variables:
;;; byte-compile-warnings: (not free-vars)
;;; End:

;;; straight-init.el ends here
