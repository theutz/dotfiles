;;;; utz-dark-theme.el --- My darkest theme
;;; Commentary:
;;
;; How dark can it get?
;;
;;; Code:
(deftheme utz-dark)

(let ((fg "#c9c3de")
      (bg "#130e21")
      (c0 "#251d38")
      (c1 "#382f4f")
      (c2 "#413661")
      (c3 "#62538d")
      (c4 "#806fb2")
      (c5 "#9185bb")
      (c6 "#b8b0d3")
      (c7 "#e3e1ee")
      (c8 "#e977ba")
      (c9 "#f7aad4")
      (c10 "#8e9a3c")
      (c11 "#ed8cc4")
      (c12 "#68b897")
      (c13 "#ae99ee")
      (c14 "#67c3d8")
      (c15 "#f8a97e"))
  (custom-theme-set-faces
   'utz-dark
   `(default ((t (:background ,bg :foreground ,fg))))
   `(font-lock-builtin-face ((t (:foreground ,c11))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,c3))))
   `(font-lock-comment-face ((t (:foreground ,c5))))
   `(font-lock-keyword-face ((t (:foreground ,c13))))
   `(font-lock-type-face ((t (:foreground ,c14))))
   `(fringe ((t (:background ,c0))))
   `(hl-line ((t (:foreground ,c2 :background ,c15))))
   `(line-number ((t (:background ,c0 :foreground ,c4))))
   `(line-number-current-line ((t (:background ,c15 :foreground ,bg))))
   `(mode-line ((t (:background ,c3 :foreground ,c7))))
   `(org-block ((t (:background ,c0 :foreground ,c7))))
   `(org-block-begin-line ((t (:foreground ,c5 :background ,c1 :height 0.8))))
   `(org-block-end-line ((t (:foreground ,c5 :background ,c1 :height 0.8))))
   `(org-drawer ((t (:foreground ,c4))))
   `(org-link ((t (:foreground ,c12))))
   `(org-special-keyword ((t (:foreground ,c9))))
   `(outline-1 ((t (:foreground ,c14))))
   `(outline-2 ((t (:foreground ,c13))))
   `(outline-3 ((t (:foreground ,c8))))
   `(outline-4 ((t (:foreground ,c12))))
   `(powerline-active1 ((t (:background ,c14 :foreground ,c2))))
   `(powerline-active2 ((t (:background ,c1))))
   `(region ((t (:foreground ,bg :background ,c12))))
   `(show-paren-match ((t (:foreground ,bg :background ,c11))))
   `(spaceline-evil-insert ((t (:foreground ,c7 :background ,c10))))
   `(spaceline-evil-normal ((t (:foreground ,bg :background ,c15))))
   `(vertical-border ((t (:foreground ,c4))))))

(provide 'utz-dark)
;;; utz-dark-theme.el ends here
