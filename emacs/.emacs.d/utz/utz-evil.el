;;; utz-evil.el -- Evil Configuration
;;
;;; Commentary:
;;
;; Evil setup
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'evil)
(require 'evil)

(evil-mode 1)

(with-eval-after-load 'magit
  (straight-use-package 'evil-magit)
  (require 'evil-magit))

(provide 'utz-evil)

;;; utz-evil.el ends here
