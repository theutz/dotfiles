;;; utz-helm.el -- Helm Configuration
;;
;;; Commentary:
;;
;; All ahead full.
;;
;;; Code:

(require 'utz-straight)
(require 'utz-general)

(straight-use-package 'helm)
(require 'helm)

(add-hook 'after-init-hook '(lambda () (helm-mode 1)))

(with-eval-after-load 'general
  (general-define-key "M-x" 'helm-M-x))

(with-eval-after-load 'helm
  (straight-use-package 'helm-ag)
  (require 'helm-ag)

  (straight-use-package 'helm-descbinds)
  (require 'helm-descbinds)
  (helm-descbinds-mode))

(provide 'utz-helm)

;;; utz-helm.el ends here
