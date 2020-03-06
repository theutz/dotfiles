;;;; init.el --- The real business is in `literally.org`

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

  ;; Custom file
  (setq-default custom-file (expand-file-name "custom.el" user-emacs-directory)) ; set custom-file but never load it; config custom with use-package instead
  (setq-default custom-theme-directory (expand-file-name "themes" user-emacs-directory))

  ;; Setup use-package
  ;; https://github.com/jwiegley/use-package
  (setq straight-use-package-by-default t)
  (straight-use-package 'use-package)

  ;; Setup org-mode
  ;; https://orgmode.org
  (use-package org)

  ;; Load the actual config
  (org-babel-load-file (expand-file-name "literally.org" user-emacs-directory))

  ;; Take out the trash
  (garbage-collect))

(provide 'init)
;; Local Variables:
;; byte-compile-warnings: (not unresolved free-vars)
;; End:
;;; init.el ends here
