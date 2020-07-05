;;;; utz-macros.el -- Making macros

;;; Commentary:
;;
;; Here's where some really magic shit happens.
;;

;;; Code:

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

(defmacro utz/create-leader-definer (key title)
  "Create definers that follow the leader.  \
KEY is the key(s) that should be pressed after the leader.  \
TITLE is what should appear in `which-key'.

For example, if you wrote the following:

\t\(utz/create-leader-definer \"f c\" \"Configuration\")

you would end up with a definer like this:

\tutz/set-leader-key/f-c

You could the go on to define keybindings in that sequence \
using the new definer.

\(fn KEY TITLE)"
  (let* ((definer-suffix (replace-regexp-in-string " " "-" key))
	(definer-name (intern (format "utz/set-leader-key/%s" definer-suffix))))
    `(progn
       (general-create-definer ,definer-name
	 :wrapping utz/set-leader-key
	 :infix ,key)
       (,definer-name "" '(:ignore t :wk ,title)))))

(provide 'utz-macros)

;;; utz-macros.el ends here
