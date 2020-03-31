;;; utz-helm.el -- Helm Configuration
;;
;;; Commentary:
;;
;; All ahead full.
;;
;;; Code:

(require 'straight)
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(straight-use-package 'helm-descbinds)

(require 'helm)
(require 'general)

(with-eval-after-load 'helm
  (add-hook 'after-init-hook '(lambda ()
				(helm-mode 1)))
  (require 'helm-ag)
  (require 'helm-descbinds)

  (when (fboundp 'helm-descbinds-mode)
    (helm-descbinds-mode))

  (with-eval-after-load 'general
    (general-define-key "M-x" 'helm-M-x)))

(provide 'utz-helm)

;;; utz-helm.el ends here
