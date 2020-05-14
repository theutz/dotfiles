;; utz-interface.el -- Interface Configuration
;;
;;; Commentary:
;;
;; Things are looking up.
;;
;;; Code:

(require 'which-key)
(require 'diminish)
(require 'ranger)
(require 'helm)
(require 'general)
(require 'helm-ag)
(require 'helm-descbinds)
(require 'magit)
(require 'doom-themes)
(require 'helpful)
(require 'unicode-fonts)
(require 'undo-tree)
(require 'paredit)
(require 'ws-butler)
(require 'evil-commentary)
(require 'projectile)
(require 'helm-projectile)
(require 'bm)
(require 'emojify)

(add-hook 'after-init-hook #'global-emojify-mode)
(global-emojify-mode-line-mode)

(add-hook 'after-init-hook '(lambda ()
			      (helm-mode 1)))

(helm-descbinds-mode)

(which-key-mode)
(which-key-setup-side-window-bottom)
(diminish 'which-key-mode)

(defvar doom-themes-treemacs-theme "doom-colors")
(dolist (func '(doom-themes-visual-bell-config
		doom-themes-treemacs-config
		doom-themes-org-config))
  (funcall func))

(unicode-fonts-setup)

(helm-projectile-on)

(provide 'utz-interface)
;;; utz-interface.el ends here
