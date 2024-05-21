;;; lisp/just.el -*- lexical-binding: t; -*-

(use-package! just-mode)
(use-package! justl
  :config
  (let ((desc "Execute recipe")
        (fn 'justl-exec-recipe))
    (map! :desc desc
          :map just-mode-map
          :n "e"
          fn)
    (map! :desc desc
          :n "e"
          fn)))
