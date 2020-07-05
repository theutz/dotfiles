;;; project-setup.el -- Configure project-related packages and settings.

;;; Commentary:
;;
;; Treemacs, Projectile, and bears! Oh, my!
;;

;;; Code:

(require 'straight-init)

(use-package treemacs
  :init
  (declare-function treemacs-git-mode "treemacs")
  :config
  (treemacs-git-mode 'deferred))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package add-node-modules-path
  :hook (web-mode . add-node-modules-path))

(use-package projectile
  :general
  (:keymaps '(projectile-mode-map) "s-p" 'projectile-command-map)
  (utz/set-leader-key/p
    "/" '(helm-projectile-ag :wk "Search in Project")
    "f" '(helm-projectile :wk "Find file")
    "p" '(helm-projectile-switch-project :wk "Switch Project")
    "t" '(projectile-toggle-between-implementation-and-test :wk "Toggle Implementation/Test")
    "T" '(projectile-find-implementation-or-test-other-window :wk "Toggle Implementation/Test Other Window")
    "C-t" '(projectile-find-implementation-or-test-other-frame :wk "Toggle Implemenation/Test Other Frame"))
  :init
  (declare-function projectile-mode "projectile")
  :config
  (projectile-mode +1))

(provide 'project-setup)

;;; project-setup.el ends here
