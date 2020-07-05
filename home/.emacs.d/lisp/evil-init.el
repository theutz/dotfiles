;;;; evil-init.el -- Setup all my evils

;;; Commentary:
;;
;; Here there be evils.
;;

;;; Code:

(require 'straight-init)

(use-package evil
	:demand t
	:init
	(declare-function evil-mode "evil")
	(declare-function evil-insert-state "evil")
	(declare-function evil-set-command-property "evil")

	(setq evil-want-integration t
				evil-want-keybinding nil
				evil-want-C-u-scroll t
				evil-split-window-below nil
				evil-shift-width 2)
	:config
	(evil-mode 1))

(use-package evil-surround
	:after evil
	:init
	(declare-function global-evil-surround-mode "evil-surround")
	:config
	(global-evil-surround-mode 1))

(use-package treemacs-evil
	:after (evil treemacs))

(use-package evil-collection
	:after evil
	:init
	(declare-function evil-collection-init "evil-collection")
	:config
	(evil-collection-init))

(use-package evil-commentary
	:after evil
	:init
	(declare-function evil-commentary-mode "evil-commentary")
	:config
	(evil-commentary-mode))

(use-package evil-magit
	:after (evil magit))

(use-package evil-org
	:after evil
	:hook ((org-mode . evil-org-mode)
				 (evil-org-mode . (lambda () (evil-org-set-key-theme))))
	:init
	(declare-function evil-org-set-key-theme "evil-org")
	(declare-function evil-org-agenda-set-keys "evil-org")
	:config
	(evil-org-agenda-set-keys))

(provide 'evil-init)

;;; evil-init.el ends here
