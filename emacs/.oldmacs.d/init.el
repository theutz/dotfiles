;;;; init.el --- Bootstrap my literate config.

;;; Commentary:
;; The goodness lives in literally.org

;;; Code:
(let ((gc-cons-threshold most-positive-fixnum))
  ;; Setup straight.el
  ;; https://github.com/raxod502/straight.el
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
  ;; End setup straight.el

  ;; Setup use-package
  ;; https://github.com/jwiegley/use-package
  (setq straight-use-package-by-default t)
  (straight-use-package 'use-package)

  ;; Setup org-mode
  ;; https://orgmode.org
  (straight-use-package 'org)
  (require 'org)

  ;; Load the actual config
  (org-babel-load-file (expand-file-name "literally.org" user-emacs-directory))

  ;; Take out the trash
  (garbage-collect))

(provide 'init)
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; init.el ends here
