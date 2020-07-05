;;;; init.el -- The main starting point.
;; =====================================

;;; Commentary:
;; ------------
;; We'll use org-babel from here-on-out.

;;; Code:
;; ------

(let ((gc-cons-threshold most-positive-fixnum))
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

  (require 'setup-straight)
  (straight-use-package 'use-package)
  (straight-use-package 'org)
  (require 'org)

  (org-babel-load-file
   (expand-file-name "config.org" user-emacs-directory))

  (garbage-collect))

(provide 'init.el)

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:

;;; init.el ends here
