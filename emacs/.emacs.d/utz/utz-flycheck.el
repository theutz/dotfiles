;;; utz-flycheck.el -- Flycheck Configuration
;;
;;; Commentary:
;;
;; Check your fly.
;;
;;; Code:

(require 'straight)
(straight-use-package 'flycheck)
(require 'flycheck)

(with-eval-after-load 'flycheck
  (global-flycheck-mode))

(provide 'utz-flycheck)

;;; utz-flycheck.el ends here
