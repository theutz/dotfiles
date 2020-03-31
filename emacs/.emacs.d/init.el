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
(require 'utz-customize)
(require 'utz-packages)
(require 'utz-languages)
(require 'utz-funcs)
(require 'utz-interface)
(require 'utz-keybindings)
(require 'utz-editing)
(require 'utz-utilities)

;; Load the Theme

(add-hook 'after-init '(lambda ()
  (load-theme (car custom-enabled-themes))))

;; Reload the Customizations

(load-file custom-file)

(provide 'init)
;;; init.el ends here
