;;;; init.el -- Bootstrap my Emacs configuration
;;
;;; Commentary:
;; This is the main entry point for my Emacs configuration.
;;
;; The primary goal is to add the "lisp" directory to the load-path, so
;; that we can get everything up-and-running.
;;
;; We also suspend garbage collection during this process to speed-up
;; load times ever-so-slightly.
;;
;;; Code:

(let ((gc-cons-threshold most-positive-fixnum))
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

  (require 'config)

  (garbage-collect))

(provide 'init.el)

;; Local Variables:
;; byte-compile-warnings: (not unresolved)
;; End:

;;; init.el ends here
