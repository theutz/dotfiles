;;;; web-init.el -- Everything web related

;;; Commentary:
;;
;; Don't eat tide pods.
;;

;;; Code:

(require 'straight-init)

(use-package web-mode
	:mode ("\\.html\\'"
				 "\\.js[x]?\\'"
				 "\\.ts[x]?\\'"
				 "\\.json\\'")
	:init
	(setq web-mode-code-indent-offset 2
				web-mode-enable-auto-quoting nil))

(use-package typescript-mode)

(use-package tide
	:after (typescript-mode company flycheck)
	:hook ((typescript-mode . 'setup-tide-mode)
				 (web-mode . (lambda ()
											 (when
													 (string-equal
														"tsx"
														(file-name-extension buffer-file-name))
												 (setup-tide-mode)))))
	:init
	(setq company-tooltip-align-annotations t))

(defun setup-tide-mode ()
	(interactive)
	(tide-setup)
	(flycheck-mode +1)
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1))

(use-package prettier-js
	:hook (web-mode . prettier-js-mode))


(provide 'web-init)
;;; web-init.el ends here
