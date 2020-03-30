;;; utz-company.el -- Company Configuration
;;
;;; Commentary:
;;
;; Keeping good company.
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'company)
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'utz-company)

;;; utz-company.el ends here
