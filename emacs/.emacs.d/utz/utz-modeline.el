;;; utz-modeline.el -- Modeline Configuration
;;
;;; Commentary:
;;
;; Status Report:
;;
;;; Code:

(require 'diminish)
(require 'delight)
(require 'spaceline-config)
(require 'eldoc)

(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(spaceline-compile
  "utz"
  '((evil-state)
    (major-mode)
    (version-control))
  '('((line) ":" (column))
    (projectile-root)))

(setq-default mode-line-format '("%e" (:eval (spaceline-ml-utz))))

(diminish 'auto-revert-mode)

(provide 'utz-modeline)
;;; utz-modeline.el ends here
