(setq utz-config-file
      (or utz-config-file
	  (expand-file-name "emacs-config.org" user-emacs-directory)))

(setq utz-utz-directory (expand-file-name "utz" user-emacs-directory))

(setq utz-custom-file (expand-file-name "custom.el" utz-utz-directory))

(setq utz-custom-theme-directory (expand-file-name "themes" user-emacs-directory))

(setq utz-theme-modes-alist '((dark . doom-vibrant)
			      (light . doom-one-light))
      utz-theme-mode 'dark)

(defun utz/get-theme-by-mode (mode)
  (cdr (assoc mode utz-theme-modes-alist)))

(defun utz/cycle-theme-mode ()
  (interactive)
  (let ((theme-mode (if (equal utz-theme-mode 'light) 'dark 'light)))
    (setq utz-theme-mode theme-mode)
    (load-theme (utz/get-theme-by-mode theme-mode) t))
  (spaceline-spacemacs-theme))

(defun utz/edit-config-file ()
  (interactive)
  (find-file utz-config-file))

(defun utz/reload-config ()
  (interactive)
  (org-babel-load-file utz-config-file))

(defun utz/narrow-page-forward ()
  "Widen, forward, then narrow."
  (interactive)
  (widen)
  (forward-page)
  (narrow-to-page))

(defun utz/narrow-page-backward ()
  "Widen, backward, then narrow."
  (interactive)
  (widen)
  (backward-page)
  (backward-page)
  (narrow-to-page))

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix
      locale-coding-system 'utf-8-unix)

(setq-default custom-file utz-custom-file)
;;(load utz-custom-file 'noerror 'nomessage)

(setq custom-safe-themes t)
(setq-default custom-theme-directory utz-custom-theme-directory)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(server-force-delete)
(server-start)

(setq inhibit-splash-screen t)

(setq initial-scratch-message nil)

(show-paren-mode 1)

(menu-bar-mode 0)

(scroll-bar-mode 0)

(tool-bar-mode 0)

(use-package evil
  :init
  (setq evil-want-keybinding nil
	evil-want-C-u-scroll t
	evil-want-C-u-indent t
	evil-normal-state-tag "NORMAL"
	evil-visual-state-tag "VISUAL"
	evil-insert-state-tag "INSERT"
	evil-emacs-state-tag "EMACS"
	evil-replace-state-tag "REPLACE"
	evil-motion-state-tag "MOTION"
	evil-operator-state-tag "OPERATOR"
	evil-shift-width 2
	evil-split-window-below t
	evil-vsplit-window-right t
	evil-echo-state nil)
  :config
  (evil-mode 1))

(use-package evil-org
  :delight
  :after (org delight)
  :hook ((org-mode . evil-org-mode)
	 (evil-org-mode . (lambda ()
			    (evil-org-set-key-theme))))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-collection
  :after (evil)
  :config
  (evil-collection-init))

(use-package evil-commentary
  :delight
  :after (evil delight)
  :config (evil-commentary-mode))

(use-package evil-surround
  :after (evil)
  :config (global-evil-surround-mode 1))

(use-package evil-magit
  :after (evil magit))

(use-package general
  :config
  (general-create-definer utz/set-leader-key
    :prefix "SPC"
    :non-normal-prefix "M-SPC"
    :states '(normal visual insert emacs))

  (general-create-definer utz/set-localleader-key
    :states '(normal visual emacs)
    :prefix ","
    :non-normal-prefix "M-,")

  (general-create-definer utz/set-help-key
    :prefix "C-h"))

(utz/set-leader-key "h" `(,(general-simulate-key "C-h") :wk "Help")
  "w" `(,(general-simulate-key "C-w") :wk "Window"))

(use-package hydra
  :general
  (utz/set-leader-key
    "c ." '(utz/hydra-comment/body :wk "Hydra")
    "n ." '(utz/hydra-narrow/body :wk "Hydra")))

(with-eval-after-load 'hydra
  (defhydra utz/hydra-comment (:hint nil :exit t)
    "
      ^
      ^Figlet
      ^------^-----------------------
      _r_: Figletify Region
      _R_: Figletify Region Comment
      _i_: Figlet
      _I_: Figlet Comment
      ^
      "
    ("i" figlet)
    ("I" figlet-comment)
    ("r" figlet-figletify-region)
    ("R" figlet-figletify-region-comment)
    ("q" nil "cancel")))

(defhydra utz/hydra-narrow (:hint nil)
  "
      ^
      ^Narrow^              ^Widen^    ^Navigate^
      ^------^--------------^-----^----^--------^---------
      _p_ narrow to page    _w_ widen  _]_ next page
      _d_ narrow to defun   ^ ^        _[_ previous page
      _r_ narrow to region  ^ ^        ^ ^
      ^ ^                   ^ ^        ^ ^
      "
  ("q" nil "cancel")
  ("p" narrow-to-page)
  ("d" narrow-to-defun)
  ("r" narow-to-region)
  ("w" widen)
  ("]" utz/narrow-page-forward)
  ("[" utz/narrow-page-backward))

(use-package helm
  :after delight
  :delight
  :general
  ("M-x" '(helm-M-x :wk "Helm"))

  (utz/set-leader-key "SPC" '(helm-M-x :wk "Helm")
    "f f" '(helm-find-files :wk "Find Files")
    "b b" '(helm-buffers-list :wk "List Buffers"))

  :config
  (helm-mode 1))

(use-package helm-ag
  :after (helm)
  :general
  (utz/set-leader-key "/" '(helm-ag :wk "Silver Searcher"))
  (utz/set-leader-key :infix "s"
    "s" '(helm-ag :wk "Silver Searcher")))

(use-package spaceline
  :custom ((powerline-default-separator 'wave)
	   (spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (spaceline-info-mode))

(use-package which-key
  :after delight
  :delight
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))

(use-package ws-butler
  :delight
  :after delight
  :hook ((prog-mode . ws-butler-mode)
	 (org-mode . ws-butler-mode)))

(use-package nlinum-relative
  :hook ((prog-mode . nlinum-mode)
	 (text-mode . nlinum-mode)
	 (nlinum-mode . nlinum-relative-on))
  :config
  (nlinum-relative-setup-evil))

(use-package flycheck
  :delight
  :after delight
  :config
  (global-flycheck-mode))

(use-package undo-tree
  :after delight
  :delight)

(use-package company
  :after delight
  :delight
  :hook ((after-init . global-company-mode)))

(use-package yasnippet
  :after delight
  :delight yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package magit
  :general
  (utz/set-leader-key :infix "g"
    "" '(:ignore t :wk "Git")
    "s" '(magit-status :wk "Status")))

(use-package restart-emacs
  :general
  (utz/set-leader-key :infix "q"
    "r" '(restart-emacs :wk "Restart Emacs")))

(use-package paredit
  :after delight
  :delight
  :commands (enable-paredit-mode)
  :hook ((emacs-lisp-mode . enable-paredit-mode)))

(use-package helpful
  :general
  (:state '(normal)
	  :keymaps '(helpful-mode-map)
	  "q" '(evil-window-delete :wk "Delete Window"))

  (utz/set-help-key
    "f" '(helpful-callable :wk "Helpful Callable")
    "v" '(helpful-variable :wk "Helpful Variable")
    "k" '(helpful-key :wk "Helpful Key")
    "x" '(helpful-at-point :wk "Helpful at Point")
    "F" '(helpful-function :wk "Helpful Function")
    "c" '(helpful-command :wk "Helpful Command")))

(use-package figlet
  :defer t)

(use-package ranger
  :general
  (utz/set-leader-key "0" '(ranger :wk "Ranger"))

  :commands (ranger)
  :custom (ranger-override-dired-mode t))

(use-package diminish)

(use-package delight
  :config
  (delight 'eldoc-mode))

(use-package org
  :after (delight)
  :custom (org-M-RET-may-split-line nil))

(require 'ol)

(org-link-set-parameters "utz"
			 :follow #'utz/follow-utz-link)

(defun utz/follow-utz-link (file)
  (find-file-other-window
   (if (equal file "")
       utz-config-file
     (expand-file-name (concat file ".org")
		       utz-utz-directory))))

(org-link-set-parameters "straight"
			 :follow #'utz/follow-straight-link)

(defun utz/follow-straight-link (file)
  (find-file-read-only-other-window
   (expand-file-name file
		     (expand-file-name "repos"
				       (expand-file-name "straight"
							 user-emacs-directory)))))

(use-package org-bullets
  :after (org)
  :hook ((org-mode . (lambda () (org-bullets-mode 1)))))

(general-define-key
 :states '(normal)
 :keymaps '(org-mode-map)
 "RET" '(org-open-at-point :wk "Open at Point"))

(general-create-definer utz/set-org-mode-key
  :wrapping utz/set-localleader-key
  :keymaps '(org-mode-map))

(utz/set-org-mode-key :states '(normal visual emacs)
  "RET" '(org-open-at-point :wk "Open at Point")
  "'" '(org-edit-special :wk "Edit Special"))

(add-hook 'org-src-mode-hook
	  (lambda ()
	    (utz/set-localleader-key
	      :keymaps 'local
	      "'" '(org-edit-src-exit :wk "Exit")
	      "k" '(org-edit-src-abort :wk "Abort")
	      "s" '(org-edit-src-save :wk "Save"))))

(utz/set-org-mode-key :states '(normal visual emacs)
  :infix "l"
  "" '(:ignore t :wk "Links")
  "i" '(org-insert-link :wk "Insert")
  "t" '(org-toggle-link-display :wk "Toggle display")
  "o" '(org-open-at-point :wk "Open at Point"))

(use-package typescript-mode)

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save)))

(use-package markdown-mode
  :custom ((markdown-open-command "~/bin/mark"))
  :mode (("README\\.(md|mdown)\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

(general-define-key "s-q" '(save-buffers-kill-terminal :wk "Quit"))

(utz/set-leader-key :infix "b"
  "" '(:ignore t :wk "Buffers")
  "p" '(previous-buffer :wk "Previous Buffer")
  "n" '(next-buffer :wk "Next Buffer")
  "d" '(evil-delete-buffer :wk "Delete Buffer"))

(utz/set-leader-key :infix "c"
  "" '(:ignore t :wk "Comments"))

(utz/set-leader-key :infix "f"
  "" '(:ignore t :wk "Files")
  "s" '(save-buffer :wk  "Save"))

(utz/set-leader-key :infix "f e"
  "" '(:ignore t :wk "Emacs")
  "r" '(utz/reload-config :wk "Reload Configuration")
  "d" '(utz/edit-config-file :wk "Edit Configuration"))

(utz/set-leader-key :infix "n"
  "" '(:ignore t :wk "Narrow / Widen"))

(utz/set-leader-key :infix "q"
  "" '(:ignore t :wk "Quit / Restart")
  "q" '(save-buffers-kill-terminal :wk "Quit")
  "Q" '(kill-emacs :wk "Quit and Close Server"))

(utz/set-leader-key :infix "s"
  "" '(:ignore t :wk "Search"))

(utz/set-leader-key :infix "t"
  "" '(:ignore t :wk "Toggles")
  "f" '(toggle-frame-maximized :wk "Maximized")
  "F" '(toggle-frame-fullscreen :wk "Fullscreen"))

(utz/set-leader-key :infix "t t"
  "" '(:ignore t :wk "Theme")
  "m" '(utz/cycle-theme-mode :wk "Light / Dark Mode"))

(utz/set-leader-key "u" '(universal-argument :wk "Universal Argument"))
(utz/set-leader-key :keymaps '(universal-argument-map)
  "u" 'universal-argument-more)

(utz/set-leader-key :infix "x"
  "" '(:ignore t :wk "Eval")
  "s" '(eval-last-sexp :wk "Last S-Exp")
  "b" '(eval-buffer :wk "Buffer")
  "e" '(eval-expression :wk "Expression")
  "r" '(eval-region :wk "Region"))

(utz/set-help-key "=" '(describe-text-properties :wk "Describe Text Properties"))

(use-package doom-themes
  :custom ((doom-themes-enable-bold t)
	   (doom-themes-enable-italic t))
  :config
  (load-theme (utz/get-theme-by-mode utz-theme-mode) t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(custom-set-faces
 '(default ((t (:family "mononoki Nerd Font" :height 160))))
 '(outline-1 ((t (:height 2.0))))
 '(outline-2 ((t (:height 1.6))))
 '(outline-3 ((t (:height 1.3))))
 '(outline-4 ((t (:height 1.1)))))
