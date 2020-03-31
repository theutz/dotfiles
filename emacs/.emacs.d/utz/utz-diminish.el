;;; utz-diminish.el -- Diminish Configuration
;;
;;; Commentary:
;;
;; Shut up.
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'diminish)
(require 'diminish)

(with-eval-after-load 'diminish
  (add-hook 'eldoc-mode-hook '(lambda ()
				(diminish 'eldoc-mode)))
  (add-hook 'auto-revert-mode-hook '(lambda ()
				 (diminish 'auto-revert-mode))))

(provide 'utz-diminish)

;;; utz-diminish.el ends here
