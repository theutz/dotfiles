;;; config.el -- Generated from config.org
;;; Commentary:
;;; Code:

(setq-default flycheck-emacs-lisp-load-path 'inherit)
(require 'setup-straight)
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(require 'use-package)

(defconst utz-dotfiles-dir (expand-file-name ".dotfiles" "~"))

(defconst utz-init-file (expand-file-name "init.el" user-emacs-directory))

(defconst utz-custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst utz-config-file (expand-file-name "config.org" user-emacs-directory))

(defconst utz-snippets-directory (expand-file-name "snippets" user-emacs-directory))

(use-package sh-script
  :mode (("\\.zpreztorc\\'" . sh-mode)
	 ("\\zpreztorc\\'" . sh-mode)
	 ("\\.zprofile\\'" . sh-mode)
	 ("\\zprofile\\'" . sh-mode)
	 ("\\zshenv\\'" . sh-mode)
	 ("\\zshrc\\'" . sh-mode)))

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

(use-package general
  :demand t
  :init
  (declare-function general-define-key "general")
  (declare-function general--simulate-keys "general")
  :functions (general-simulate-C-h
	      general-simulate-C-w
	      general-simulate-s-l))

(use-package magit)

(use-package forge
  :after magit)

(use-package magit-todos
  :after magit
  :hook '(magit . magit-todos))

(use-package org
  :defines org-capture-templates
  :init
  (setq org-directory (expand-file-name "~/org")
	org-archive-location (expand-file-name "archive.org" org-directory)
	org-default-notes-file (expand-file-name "inbox.org" org-directory)
	org-capture-templates '(("t" "Todo" entry (file org-default-notes-file)
				 "* TODO %?\n\t%i\n\t%a")))
  :config
  (require 'org-inlinetask))

(use-package org-bullets
  :init
  (declare-function org-bullets-mode "org-bullets")
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package helm-org-rifle)

(use-package evil
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
  :init
  (declare-function evil-org-set-key-theme "evil-org")
  (declare-function evil-org-agenda-set-keys "evil-org")
  :hook ((org-mode . evil-org-mode)
	  (evil-org-mode . (lambda () (evil-org-set-key-theme))))
  :config
  (evil-org-agenda-set-keys))

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

(use-package projectile
  :general
  (:keymaps '(projectile-mode-map) "s-p" 'projectile-command-map)
  :init
  (declare-function projectile-mode "projectile")
  :config
  (projectile-mode +1))

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

(use-package add-node-modules-path
  :hook (web-mode . add-node-modules-path))

(use-package all-the-icons)

(use-package treemacs
  :init
  (declare-function treemacs-git-mode "treemacs")
  :config
  (treemacs-git-mode 'deferred))

(use-package treemacs-projectile
  :after (treemacs projectile))

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

(general-create-definer utz/set-leader-key
  :prefix "SPC"
  :keymaps '(normal emacs visual))

(general-create-definer utz/set-localleader-key
  :prefix ","
  :non-normal-prefix "M-,")

(defmacro utz/find-config-file (name shortcut-key file)
      "A macro for creating commands that open configuration files.

NAME should represent the configuration file, e.g. `zshrc' or `emacs'.
SHORTCUT-KEY will be appended to the `:infix' for \[utz/set-leader-key].
FILE is the absolute path that should be opened.

\(fn NAME SHORTCUT-KEY FILE)"
      (let ((funsymbol (intern (format "utz/find-config-%s" name)))
	    (doc (format "Open %s configuration file.\n`C-u' for a new window.\n`C-u C-u' for a new frame." name))
	    (shortcut (format "f c %s" shortcut-key)))
	`(progn
	   (defun ,funsymbol (arg) ,doc
		  (interactive "P")
		  (cond ((equal '(4) arg) (find-file-other-window ,file))
			((equal '(16) arg) (find-file-other-frame ,file))
			(t (find-file ,file))))
	   (utz/set-leader-key ,shortcut '(,funsymbol :wk ,name)))))

(defun utz/load-config-file (arg)
   "(Re)load Emacs with a fresh configuration file.

ARG specifies 'universal-argument' usage."
   (interactive "P")
   (cond ((equal '(4) arg) (load-file utz-init-file))
	 (t (org-babel-load-file utz-config-file))))

(utz/find-config-file "emacs" "e" utz-config-file)

(utz/find-config-file "emacs-custom" "," utz-custom-file)

(utz/find-config-file "emacs-init" "i" utz-init-file)

(utz/find-config-file "skhd" "s" (expand-file-name "home/.config/skhd/skhdrc" utz-dotfiles-dir))

(utz/find-config-file "yabai" "y" (expand-file-name "home/.config/yabai/yabairc" utz-dotfiles-dir))

(utz/find-config-file "zshrc" "z" (expand-file-name ".zshrc" "~"))

(defun utz/delete-frame ()
  "Delete the selected frame."
  (interactive)
  (condition-case nil (delete-frame) (error (save-buffers-kill-terminal))))

(general-define-key "s-q" 'utz/delete-frame
		    "C-q" 'kill-emacs)

(utz/set-leader-key
  "" '(:ignore t :wk "Leader")
  "u" '(universal-argument :wk "Universal Argument")
  "h" `(,(general-simulate-key "C-h") :wk "Help")
  "SPC" '(helm-M-x :wk "M-x"))

(utz/set-leader-key
  :keymaps '(universal-argument-map)
  "u" '(universal-argument-more :wk "Universal Argument (more...)"))

(utz/set-leader-key :infix "b"
  "" '(:ignore t :wk "Buffer")
  "b" '(helm-buffers-list :wk "List Buffers")
  "d" '(kill-this-buffer :wk "Delete Buffer")
  "n" '(next-buffer :wk "Next buffer")
  "p" '(previous-buffer :wk "Previous Buffer"))

(utz/set-leader-key :infix "f"
  "" '(:ignore t :wk "Files")
  "f" '(helm-projectile :wk "Find Files in Project")
  "F" '(helm-find-files :wk "Find Files")
  "s" '(save-buffer :wk "Save Buffer")
  "t" '(treemacs :wk "Treemacs"))

(utz/set-leader-key :infix "f c"
  "" '(:ignore t :wk "Configuration"))

(utz/set-leader-key :infix "F"
  "" '(:ignore t :wk "Frames")
  "d" '(delete-frame :wk "Delete")
  "n" '(make-frame :wk "Make"))

(utz/set-leader-key :infix "g"
    "" '(:ignore t :wk "Git")
    "b" '(magit-blame :wk "Blame")
    "c" '(magit-commit :wk "Commit")
    "l" '(magit-log :wk "Log")
    "s" '(magit-stage :wk "Stage")
    "u" '(magit-unstage :wk "Un-stage")
    "g" '(magit-status :wk "Status"))

(utz/set-leader-key :infix "l"
  "" '(:ignore t :wk "Language")
  "l" `(,(general-simulate-key "s-l") :wk "Language Server"))

(utz/set-leader-key :infix "o"
  "" '(:ignore t :wk "Org")
  "c" '(org-capture :wk "Capture"))

(utz/set-leader-key :infix "o a"
  "" '(:ignore t :wk "Agenda")
  "a" '(org-agenda :wk "Agenda"))

(utz/set-leader-key :infix "o r"
  "" '(:ignore t :wk "Rifle")
  "r" '(helm-org-rifle :wk "Open Buffers")
  "R" '(helm-org-rifle-occur :wk "Open Buffers (Occur)")
  "a" '(helm-org-rifle-agenda-files :wk "Agenda Files")
  "A" '(helm-org-rifle-occur-agenda-files :wk "Agenda Files (Occur)")
  "b" '(helm-org-rifle-current-buffer :wk "Current Buffer")
  "B" '(helm-org-rifle-occur-current-buffer :wk "Current Buffer (Occur)")
  "o" '(helm-org-rifle-org-directory :wk "Org Directory")
  "O" '(helm-org-rifle-occur-org-directory :wk "Org Directory (Occur)"))

(utz/set-leader-key :infix "p"
  "" '(:ignore t :wk "Project")
  "/" '(helm-projectile-ag :wk "Search in Project")
  "f" '(helm-projectile :wk "Find file")
  "p" '(helm-projectile-switch-project :wk "Switch Project")
  "t" '(projectile-toggle-between-implementation-and-test :wk "Toggle Implementation/Test")
  "T" '(projectile-find-implementation-or-test-other-window :wk "Toggle Implementation/Test Other Window")
  "C-t" '(projectile-find-implementation-or-test-other-frame :wk "Toggle Implemenation/Test Other Frame"))

(utz/set-leader-key :infix "q"
  "" '(:ignore t :wk "Quit")
  "q" '(utz/delete-frame :wk "Delete Frame")
  "Q" '(kill-emacs :wk "Quit Emacs")
  "r" '(utz/load-config-file :wk "Reload Configuration")
  "R" '(restart-emacs :wk "Restart Emacs"))

(utz/set-leader-key :infix "w"
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
