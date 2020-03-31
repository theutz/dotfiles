;;; utz-unicode-fonts.el -- Unicode Fonts
;;
;;; Commentary:
;;
;; One single code.
;;
;;; Code:

(require 'utz-straight)
(straight-use-package 'unicode-fonts)
(require 'unicode-fonts)

(with-eval-after-load 'unicode-fonts
  (when (fboundp 'unicode-fonts-setup)
    (unicode-fonts-setup)))

(provide 'utz-unicode-fonts)

;;; utz-unicode-fonts.el ends here
