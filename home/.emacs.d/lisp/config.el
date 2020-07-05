;;;; config.el -- Generated from config.org

;;; Commentary:

;;; Code:

(require 'setup-straight)
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

(defconst utz-dotfiles-dir (expand-file-name ".dotfiles" "~"))

(defconst utz-init-file (expand-file-name "init.el" user-emacs-directory))

(defconst utz-custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst utz-config-file (expand-file-name "config.org" user-emacs-directory))

(defconst utz-snippets-directory (expand-file-name "snippets" user-emacs-directory))

;; (server-start)

(add-to-list 'auto-mode-alist '("\\.zpreztorc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zpreztorc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zprofile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zprofile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshenv\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . sh-mode))

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

(setq org-confirm-babel-evaluate nil)

(setq inhibit-startup-screen t)

(setq initial-scratch-message nil)

(setq display-line-numbers-type 'visual)

(setq vc-follow-symlinks t)

(put 'narrow-to-region 'disabled nil)

(setq-default indent-tabs-mode 2)

(use-package general)

(use-package magit)

(use-package forge
  :after magit)

(use-package magit-todos
  :after magit
  :hook '(magit . magit-todos))

(use-package org
  :init
  (setq org-directory (expand-file-name "~/org")
	org-archive-location (expand-file-name "archive.org" org-directory)
	org-default-notes-file (expand-file-name "inbox.org" org-directory)
	org-capture-templates '(("t" "Todo" entry (file org-default-notes-file)
				 "* TODO %?\n\t%i\n\t%a")))
  :config
  (require 'org-inlinetask))

(use-package org-bullets
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package helm-org-rifle)

(use-package evil
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil
	evil-want-C-u-scroll t
	evil-split-window-below nil
	evil-shift-width 2)
  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (straight-use-package 'evil-org)
  (require 'evil-org)
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda ()
	      (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(with-eval-after-load 'evil
  (straight-use-package 'evil-surround)
  (require 'evil-surround)
  (global-evil-surround-mode 1))

(with-eval-after-load 'evil
  (with-eval-after-load 'magit
    (straight-use-package 'evil-magit)
    (require 'evil-magit)))

(straight-use-package 'treemacs-evil)
(with-eval-after-load 'evil
  (with-eval-after-load 'treemacs
    (require 'treemacs-evil)))

(straight-use-package 'evil-collection)
(require 'evil-collection)
(evil-collection-init)

(straight-use-package 'evil-commentary)
(require 'evil-commentary)
(evil-commentary-mode)

(straight-use-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '(utz-snippets-directory))
(setq yas-verbosity 2)
(yas-global-mode 1)

(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(use-package projectile
  :general
  (:keymaps '(projectile-mode-map) "s-p" 'projectile-command-map)
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
  :mode
  ("\\.html?\\'" . web-mode)
  ("\\.jsx?\\'" . web-mode)
  ("\\.tsx?\\'" . web-mode)
  ("\\.json\\'" . web-mode))

(use-package vterm
  :init
  (setq vterm-kill-buffer-on-exit t)
  :config
  (add-hook 'vterm-mode-hook (lambda ()
			       (setq-local evil-insert-state-cursor 'box)
			       (evil-insert-state))))

(use-package multi-vterm
  :after vterm)

(use-package flycheck
  :after (exec-path-from-shell)
  :config
  (global-flycheck-mode))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(straight-use-package 'restart-emacs)
(require 'restart-emacs)

(use-package company
  :hook (after-init . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package helm
  :config
  (helm-mode 1))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package helm-ag
  :after (helm exec-path-from-shell))

(use-package which-key
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package prettier-js
  :hook (web-mode . prettier-js-mode))

(use-package add-node-modules-path
  :hook (web-mode . add-node-modules-path))

(straight-use-package 'all-the-icons)
(require 'all-the-icons)

(use-package treemacs
  :config
  (treemacs-git-mode 'deferred))

(use-package treemacs-projectile
  :after (treemacs projectile))

(straight-use-package 'helpful)
(require 'helpful)

(use-package finder+)

(straight-use-package 'doom-themes)
(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)

(doom-themes-visual-bell-config)
(doom-themes-org-config)
(with-eval-after-load 'treemacs
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
   "(Re)load emacs with a fresh configuration file."
   (interactive "P")
   (cond ((equal '(4) arg) (load-file utz-init-file))
	 (t (org-babel-load-file utz-config-file))))
   ;; (let ((file (cond ((equal '(4) arg) utz-init-file)
   ;; 		     (t utz-config-file))))
   ;;   (message file)
   ;;   (load-file file)))

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
