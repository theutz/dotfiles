;;; utz-company.el -- Company Configuration
;;
;;; Commentary:
;;
;; Keeping good company.
;;
;;; Code:

(require 'company)

(with-eval-after-load 'company
  (add-hook 'after-init-hook 'global-company-mode)
  (require 'company-emoji)

  (with-eval-after-load 'company-emoji
    (add-to-list 'company-backends 'company-emoji)))

(provide 'utz-company)

;;; utz-company.el ends here
