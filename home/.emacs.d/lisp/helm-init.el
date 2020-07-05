;;;; helm-init.el -- Setup the ol' helm.

;;; Commentary:
;;
;; This is in my wheelhouse.
;;

;;; Code:

(require 'straight-init)

(use-package helm
  :functions helm-mode
  :config
  (helm-mode 1))

(use-package helm-projectile
  :init
  (declare-function helm-projectile-on "helm-projectile")
  :config
  (helm-projectile-on))

(use-package helm-ag
  :after (helm exec-path-from-shell))

(provide 'helm-init)

;;; helm-init.el ends here
