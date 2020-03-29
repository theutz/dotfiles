;;; core-funcs.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Our bread and butter.
;;
;;; Code:

;;;### autoload
(defun utz/edit-config ()
  "Edit user configuration variables."
  (interactive)
  (find-file utz-config-file))

;;;### autoload
(defun utz/reload-config ()
  "Reload our emacs configuration."
  (interactive)
  (load (expand-file-name "init.el"
			       utz-start-directory)
	     nil (not init-file-debug)))

(provide 'core-funcs)

;;; core-funcs.el ends here.
