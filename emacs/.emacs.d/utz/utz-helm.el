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

(with-eval-after-load 'general
  (general-define-key "M-x" 'helm-M-x))

(provide 'utz-helm)

;;; utz-helm.el ends here
