;;; config.el -- Generated from config.org

;;; Commentary:
;;
;; This is pretty-much the config.
;;

;;; Code:

(require 'utz-vars)
(require 'straight-init)
(require 'general-init)
(require 'evil-init)
(require 'org-init)
(require 'helm-init)
(require 'magit-init)
(require 'web-init)
(require 'utz-macros)
(require 'utz-funcs)
(require 'project-setup)
(require 'other-packages)

(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq custom-file utz-custom-file)
(load custom-file)

(tool-bar-mode 0)

(menu-bar-mode 0)

(show-paren-mode 1)

(global-whitespace-mode 1)

(global-display-line-numbers-mode 1)

(scroll-bar-mode 0)

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

(defvar org-confirm-babel-evaluate)
(setq org-confirm-babel-evaluate nil)

(setq inhibit-startup-screen t)

(setq initial-scratch-message nil)

(defvar display-line-numbers-type)
(setq display-line-numbers-type 'visual)

(setq vc-follow-symlinks t)

(put 'narrow-to-region 'disabled nil)

(setq-default indent-tabs-mode 2)
(setq-default tab-width 2)

(general-define-key "s-q" 'utz/delete-frame
										"C-q" 'kill-emacs)

(utz/set-leader-key "u" '(universal-argument :wk "Universal Argument")
	"h" `(,(general-simulate-key "C-h") :wk "Help")
	"SPC" '(helm-M-x :wk "M-x"))

(utz/set-leader-key
	:keymaps '(universal-argument-map)
	"u" '(universal-argument-more :wk "Universal Argument (more...)"))

(utz/set-leader-key/b
	"b" '(helm-buffers-list :wk "List Buffers")
	"e" '(eval-buffer :wk "Evaluate Current Buffer")
	"d" '(kill-this-buffer :wk "Delete Buffer")
	"n" '(next-buffer :wk "Next buffer")
	"p" '(previous-buffer :wk "Previous Buffer"))

(utz/set-leader-key/f
	"f" '(helm-projectile :wk "Find Files in Project")
	"F" '(helm-find-files :wk "Find Files")
	"s" '(save-buffer :wk "Save Buffer")
	"t" '(treemacs :wk "Treemacs"))

(utz/set-leader-key/F
	"d" '(delete-frame :wk "Delete")
	"n" '(make-frame :wk "Make"))

(utz/set-leader-key/g
	"b" '(magit-blame :wk "Blame")
	"c" '(magit-commit :wk "Commit")
	"l" '(magit-log :wk "Log")
	"s" '(magit-stage :wk "Stage")
	"u" '(magit-unstage :wk "Un-stage")
	"g" '(magit-status :wk "Status"))

(utz/set-leader-key/l
	"l" `(,(general-simulate-key "s-l") :wk "Language Server"))

(utz/set-leader-key/q
	"q" '(utz/delete-frame :wk "Delete Frame")
	"Q" '(kill-emacs :wk "Quit Emacs")
	"r" '(utz/load-config-file :wk "Reload Configuration")
	"R" '(restart-emacs :wk "Restart Emacs"))

(utz/set-leader-key/w
	"" `(,(general-simulate-key "C-w") :wk "Window"))

(utz/set-localleader-key
	:states '(normal)
	:keymap 'vterm-mode-map
	"c" '(multi-vterm :wk "Create New Terminal")
	"n" '(multi-vterm-next :wk "Next Terminal")
	"p" '(multi-vterm-prev :wk "Previous Terminal"))

(utz/set-localleader-key
	:states '(normal insert)
	:keymaps '(org-mode-map)
	"'" '(org-edit-special :wk "Edit Special"))

(general-create-definer utz/set-help-key
	:prefix "C-h")

(utz/set-help-key
	"f" '(helpful-callable :wk "Callable")
	"v" '(helpful-variable :wk "Variable")
	"x" '(helpful-at-point :wk "At Point")
	"k" '(helpful-at-key :wk "Key")
	"F" '(helpful-function :wk "Function")
	"c" '(helpful-command :wk "Command"))

(general-define-key :states '(insert) "C-SPC" 'company-complete)

(provide 'config)

;;; config.el ends here
