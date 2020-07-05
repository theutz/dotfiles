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
(require 'utz-macros)
(require 'utz-funcs)
(require 'project-setup)

(use-package sh-script
  :mode (("\\.zpreztorc\\'" . sh-mode)
	 ("\\zpreztorc\\'" . sh-mode)
	 ("\\.zprofile\\'" . sh-mode)
	 ("\\zprofile\\'" . sh-mode)
	 ("\\zshenv\\'" . sh-mode)
	 ("\\zshrc\\'" . sh-mode)))

(setq-default flycheck-emacs-lisp-load-path 'inherit)
(setq custom-file utz-custom-file)
(load custom-file)

(tool-bar-mode 0)

(menu-bar-mode 0)

(show-paren-mode 1)

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

(use-package yasnippet
  :init
  (declare-function yas-global-mode "yasnippet")
  :config
  (setq yas-snippet-dirs '(utz-snippets-directory)
	yas-verbosity 2)
  (yas-global-mode 1))

(use-package git-gutter
  :init
  (declare-function global-git-gutter-mode "git-gutter")
  :config
  (global-git-gutter-mode +1))

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "s-l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 (web-mode . lsp-mode))
  :commands (lsp))

(use-package lsp-ui
  :commands (lsp-ui-mode)
  :config
  (add-to-list 'lsp-ui-doc-frame-parameters '(no-accept-focus . t)))

(use-package helm-lsp
  :commands (helm-lsp-workspace-symbol))

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package web-mode
  :init
  (setq web-mode-code-indent-offset 2)
  :mode ("\\.html?\\'"
	 "\\.jsx?\\'"
	 "\\.tsx?\\'"
	 "\\.json\\'"))

(use-package vterm
  :after evil
  :init
  (setq vterm-kill-buffer-on-exit t)
  :config
  (add-hook 'vterm-mode-hook (lambda ()
			       (setq-local evil-insert-state-cursor 'box)
			       (evil-insert-state))))

(use-package multi-vterm
  :after vterm)

(use-package flycheck
  :functions global-flycheck-mode
  :after (exec-path-from-shell)
  :config
  (global-flycheck-mode))

(use-package exec-path-from-shell
  :init
  (declare-function exec-path-from-shell-initialize "exec-path-from-shell")
  :config
  (exec-path-from-shell-initialize))

(use-package restart-emacs)

(use-package company
  :hook (after-init . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package which-key
  :demand t
  :init
  (declare-function which-key-setup-side-window-bottom "which-key")
  (declare-function which-key-mode "which-key")
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package prettier-js
  :hook (web-mode . prettier-js-mode))

(use-package all-the-icons)

(use-package helpful)

(use-package finder+)

(use-package doom-themes
  :functions (doom-themes-visual-bell-config
	     doom-themes-org-config
	     doom-themes-treemacs-config)
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-themes-treemacs-config))

(general-define-key "s-q" 'utz/delete-frame
		    "C-q" 'kill-emacs)

(utz/set-leader-key
  "u" '(universal-argument :wk "Universal Argument")
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

(add-hook 'org-src-mode-hook
	  (lambda ()
	    (utz/set-localleader-key
	      :states '(normal)
	      :keymap 'org-src-mode-map
	      "'" '(org-edit-src-exit :wk "Exit"))))

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
