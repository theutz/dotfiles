;;; utz-general.el -- General.el Configuration
;;
;;; Commentary:
;;
;; Nobody does it like the general.
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'general)
(require 'general)

(general-create-definer utz/set-leader-key
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  :states '(normal visual insert emacs))

(general-create-definer utz/set-localleader-key
  :prefix ","
  :non-normal-prefix "M-,"
  :states '(normal visual emacs))

(general-create-definer utz/set-help-key
  :prefix "C-h")

(provide 'utz-general)

;;; utz-general.el ends here
