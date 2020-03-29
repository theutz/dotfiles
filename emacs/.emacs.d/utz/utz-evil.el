;;; utz-evil.el -- Evil Configuration
;;
;;; Commentary:
;;
;; Evil setup
;;
;;; Code:

(straight-use-package 'evil)
(require 'evil)

(with-eval-after-load 'evil
  (evil-mode 1))

(with-eval-after-load 'magit
  (straight-use-package 'evil-magit)
  (require 'evil-magit))

(provide 'utz-evil)

;;; utz-evil.el ends here.
