;;; utz-flycheck.el -- Flycheck Configuration
;;
;;; Commentary:
;;
;; Check your fly.
;;
;;; Code:

(require 'flycheck)
(require 'delight)

(with-eval-after-load 'flycheck
  (global-flycheck-mode)
  (delight 'flycheck-mode " 🦟"))

(provide 'utz-flycheck)

;;; utz-flycheck.el ends here
