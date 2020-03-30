;;; utz-org.el -- Org Mode
;;
;;; Commentary:
;;
;; The Org.
;;
;;; Code:

(require 'utz-straight)
(straight-use-package 'org)
(straight-use-package 'org-bullets)

(require 'org)

(with-eval-after-load 'org
  (require 'org-bullets)

  (add-hook 'org-mode-hook '(lambda ()
			      (org-bullets-mode 1))))

(provide 'utz-org)

;;; utz-org.el ends here
