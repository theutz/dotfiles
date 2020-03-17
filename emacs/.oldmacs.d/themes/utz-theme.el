;;;; utz-theme.el --- Michael Utz's theme

;;; Commentary:
;;
;; This is neat.
;;
;;; Code:
(deftheme utz
  "All the stuff I love.")

(let ((fg "#c9c3de")
      (bg "#130e21")
      (c0 "#1e1732")
      (c1 "#281f3f")
      (c2 "#392e59")
      (c3 "#52437d")
      (c4 "#705fa2")
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
   'utz
   `(default ((t (:background ,bg :foreground ,fg :height 140 :family "JetBrainsMono Nerd Font"))))
   `(cursor ((t (:background ,c7))))
   `(region ((t (:background ,fg :foreground ,bg))))
   `(fringe ((t (:foreground ,bg))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,c9))))
   `(font-lock-comment-face ((t (:foreground ,c8))))
   `(font-lock-keyword-face ((t (:foreground ,c14))))
   `(font-lock-string-face ((t (:foreground ,c15))))
   `(mode-line ((t (:foreground ,c1 :background ,c12))))
   `(mode-line-inactive ((t (:foreground ,c5 :background ,c2))))))

(provide-theme 'utz)
;;; utz-theme.el ends here
