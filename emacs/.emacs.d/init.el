;;; init.el -- Utz Emacs Configuration
;;
;;; Commentary:
;;
;; Bootstrap the system.
;;
;;; Code:

;; Setup Customize
(setq custom-file
      (expand-file-name "custom.el"
			user-emacs-directory))
(load-file custom-file)

;; Setup Load Path
(add-to-list 'load-path
	     (expand-file-name "utz"
			       user-emacs-directory))

;; Require all the things
(require 'utz-basics)
(require 'utz-advice)
(require 'utz-straight)
(require 'utz-evil)
(require 'utz-general)
(require 'utz-helm)
(require 'utz-magit)
(require 'utz-flycheck)
(require 'utz-restart-emacs)
(require 'utz-doom-themes)
(require 'utz-org)
(require 'utz-which-key)
(require 'utz-unicode-fonts)
(require 'utz-spaceline)
(require 'utz-ws-butler)
(require 'utz-paredit)
(require 'utz-ranger)
(require 'utz-helpful)
(require 'utz-company)
(require 'utz-diminish)
(require 'utz-delight)
(require 'utz-sh-mode)
(require 'utz-funcs)
(require 'utz-hooks)
(require 'utz-keybindings)

(add-hook 'after-init '(lambda ()
  (load-theme (car custom-enabled-themes))))

(load-file custom-file)

(provide 'init)

;;; init.el ends here
