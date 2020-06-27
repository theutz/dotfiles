;;;; init.el -- The main starting point.
;; =====================================

;;; Commentary:
;; ------------
;; We'll use org-babel from here-on-out.

;;; Code:
;; ------

(let ((gc-cons-threshold most-positive-fixnum))
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

  (require 'straight)
  (straight-use-package 'org)
  (require 'org)

  (org-babel-load-file
   (expand-file-name "config.org" user-emacs-directory))

  (garbage-collect))

(provide 'init.el)
;;; init.el ends here
