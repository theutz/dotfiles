;;;; utz-macros.el -- Making macros

;;; Commentary:
;;
;; Here's where some really magic shit happens.
;;

;;; Code:

(require 'general-init)

(defmacro utz/find-config-file (name shortcut-key file)
      "A macro for creating commands that open configuration files.

NAME should represent the configuration file, e.g. `zshrc' or `emacs'.
SHORTCUT-KEY will be appended to the `:infix' for \[utz/set-leader-key].
FILE is the absolute path that should be opened.

\(fn NAME SHORTCUT-KEY FILE)"
      (let ((funsymbol (intern (format "utz/find-config-%s" name)))
	    (doc (format "Open %s configuration file.\n`C-u' for a new window.\n`C-u C-u' for a new frame." name))
	    (shortcut (format "f c %s" shortcut-key)))
	`(progn
	   (defun ,funsymbol (arg) ,doc
		  (interactive "P")
		  (cond ((equal '(4) arg) (find-file-other-window ,file))
			((equal '(16) arg) (find-file-other-frame ,file))
			(t (find-file ,file))))
	   (utz/set-leader-key ,shortcut '(,funsymbol :wk ,name)))))

(provide 'utz-macros)

;;; utz-macros.el ends here
