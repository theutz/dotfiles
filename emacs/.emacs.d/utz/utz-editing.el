;;; utz-editing.el -- Editing Tools
;;
;;; Commentary:
;;
;; Sharpen the axe
;;
;;; Code:

(require 'flycheck)
(require 'ws-butler)
(require 'paredit)
(require 'company)
(require 'company-emoji)
(require 'rainbow-mode)
(require 'yasnippet)
(require 'figlet)
(require 'projectile)
(require 'persp-mode)
(require 'persp-mode-projectile-bridge)

;; Modes

(global-flycheck-mode)
(yas-global-mode 1)
(projectile-mode +1)

;; Settings

(defvar wg-morph-on-kill nil)
(add-to-list 'company-backends 'company-emoji)

;; Hooks

(add-hook 'prog-mode-hook 'ws-butler-mode)
(add-hook 'org-mode-hook 'ws-butler-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'org-mode-hook 'rainbow-mode)
(add-hook 'after-init-hook '(lambda () (persp-mode 1)))

(with-eval-after-load "persp-mode-projectile-bridge-autoloads"
  (add-hook 'persp-mode-projectile-bridge-mode-hook
	    #'(lambda ()
		(if persp-mode-projectile-bridge-mode
		    (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
		  (persp-mode-projectile-bridge-kill-perspectives))))
  (add-hook 'after-init-hook
	    #'(lambda ()
		(persp-mode-projectile-bridge-mode 1))
	    t))

(provide 'utz-editing)
;;; utz-editing.el ends here
