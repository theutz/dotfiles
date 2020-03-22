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
   ;; Standard Faces
   `(default ((t (:background ,bg
		  :foreground ,fg))))
   `(hl-line ((t (:foreground ,c2 :background ,c15))))
   `(fringe ((t (:background ,c0))))
   `(vertical-border ((t (:foreground ,c4))))
   `(region ((t (:foreground ,c7 :background ,c12))))

   ;; Font Lock Faces
   `(font-lock-keyword-face ((t (:foreground ,c13))))
   `(font-lock-type-face ((t (:foreground ,c14))))
   `(font-lock-comment-face ((t (:foreground ,c5))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,c3))))

   ;; Line Numbers
   `(line-number ((t (:background ,c0 :foreground ,c3 :height 100))))
   `(nlinum-relative-current-face ((t (:background ,c15))))

   ;; Org
   `(org-link ((t (:foreground ,c12))))

   ;; Org Headlines
   `(outline-1 ((t (:foreground ,c8))))
   `(outline-2 ((t (:foreground ,c14))))
   `(outline-3 ((t (:foreground ,c15))))
   `(outline-4 ((t (:foreground ,c10))))

   ;; Org Drawers
   `(org-drawer ((t (:foreground ,c4))))
   `(org-special-keyword ((t (:foreground ,c9))))

   ;; Org Blocks
   `(org-block-begin-line ((t (:foreground ,c5
					 :background ,c1
					 :height 0.8))))
   `(org-block ((t (:background ,c0
				:foreground ,c7))))
   `(org-block-end-line ((t (:foreground ,c5
					:background ,c1
					:height 0.8))))))

(provide 'utz-dark)
;;; utz-dark-theme.el ends here
