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
(add-to-list 'load-path (expand-file-name "utz"
					  user-emacs-directory))

(require 'utz-basics)
(require 'utz-straight)
(require 'utz-evil)
(require 'utz-general)
(require 'utz-helm)
(require 'utz-magit)
(require 'utz-flycheck)
(require 'utz-restart-emacs)
(require 'utz-which-key)
(require 'utz-ranger)
(require 'utz-helpful)
(require 'utz-company)
(require 'utz-diminish)
(require 'utz-delight)
(require 'utz-funcs)
(require 'utz-keybindings)

;;; init.el ends here
