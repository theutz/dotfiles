;;; lisp/line-spacing.el -*- lexical-binding: t; -*-

(defvar theutz-line-spacing 0.5
  "Amount of line spacing to use when toggling line spacing")

(defun theutz-toggle-line-spacing ()
  "Toggle line spacing between no extra space to a lil extra space"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing theutz-line-spacing))
  (redraw-frame (selected-frame)))

(map! :desc "Line spacing"
      :leader
      :n "ts"
      #'theutz-toggle-line-spacing)

(setq theutz-line-spacing 0.3)
