;;; utz-modeline.el -- Modeline Configuration
;;
;;; Commentary:
;;
;; Status Report:
;;
;;; Code:

(require 'diminish)
(require 'delight)
(require 'spaceline)
(require 'spaceline-config)
(require 'eldoc)

(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(spaceline-helm-mode)
(spaceline-info-mode)
(spaceline-toggle-buffer-size-off)

(diminish 'auto-revert-mode)

(provide 'utz-modeline)
;;; utz-modeline.el ends here
