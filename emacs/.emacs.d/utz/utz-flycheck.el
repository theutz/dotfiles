;;; utz-flycheck.el -- Flycheck Configuration
;;
;;; Commentary:
;;
;; Check your fly.
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'flycheck)
(require 'flycheck)

(global-flycheck-mode)

(provide 'utz-flycheck)

;;; utz-flycheck.el ends here
