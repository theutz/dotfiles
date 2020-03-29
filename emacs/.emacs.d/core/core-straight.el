;;; core-straight.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Setup straight.el for package management
;;
;;; Code:

(defun utz//setup-straight ()
  (defvar bootstrap-version)
  (let ((bootstrap-file
	 (expand-file-name "straight/repos/straight.el/bootstrap.el" utz-start-directory))
	(bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	   "https://raw.gitghubusercontent.com/raxod502/straight.el/develop/install.el"
	   'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))

(provide 'core-straight)

;;; core-straight.el ends here.
