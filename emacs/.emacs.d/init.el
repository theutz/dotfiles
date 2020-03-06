;;;; init.el --- The config to end all configs

;;; Commentary:
;;
;;  _      _ _         _
;; (_)_ _ (_) |_   ___| |
;; | | ' \| |  _|_/ -_) |
;; |_|_||_|_|\__(_)___|_|
;;

;;; Code:

;;  ___          _      ___      _   _   _
;; | _ ) __ _ __(_)__  / __| ___| |_| |_(_)_ _  __ _ ___
;; | _ \/ _` (_-< / _| \__ \/ -_)  _|  _| | ' \/ _` (_-<
;; |___/\__,_/__/_\__| |___/\___|\__|\__|_|_||_\__, /__/
;;                                             |___/

;; Usin' the ol' UTF-8

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Setup the exec path

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Setup config file
(defconst utz-config-file (expand-file-name (concat user-emacs-directory "init.el")))

;; Setup custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-hook 'after-init-hook (lambda () (load custom-file)))

;; Setup backup files
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; Allow "weird" functions
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;       _
;;  _  _| |_ ___
;; | || |  _|_ /
;;  \_,_|\__/__|

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

(defun utz/load-config-file ()
  "Load configuration file all over again."
  (interactive)
  (load utz-config-file))

(defun utz/edit-config-file ()
  "Edit the configs."
  (interactive)
  (find-file utz-config-file))

;;     _            _      _   _         _
;;  __| |_ _ _ __ _(_)__ _| |_| |_   ___| |
;; (_-<  _| '_/ _` | / _` | ' \  _|_/ -_) |
;; /__/\__|_| \__,_|_\__, |_||_\__(_)___|_|
;;                   |___/

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)
(straight-use-package 'use-package)

;;                             _       _
;;  __ _ ___ _ _  ___ _ _ __ _| |  ___| |
;; / _` / -_) ' \/ -_) '_/ _` | |_/ -_) |
;; \__, \___|_||_\___|_| \__,_|_(_)___|_|
;; |___/

(use-package general)

;; Setup constants
(defvar utz-leader-key "SPC")
(defvar utz-local-leader-key ",")
(defvar utz-standard-definer-keymaps '(normal insert emacs visual))

;; Setup basic definers
(general-create-definer utz/set-leader-key
  :prefix utz-leader-key
  :non-normal-prefix (concat "M-" utz-leader-key)
  :keymaps utz-standard-definer-keymaps)

(general-create-definer utz/set-local-leader-key
  :prefix utz-local-leader-key
  :non-normal-prefix (concat "M-" utz-local-leader-key)
  :keymaps utz-standard-definer-keymaps)

;; Setup "SPC" keys

(utz/set-leader-key "u" '(universal-argument :wk "Universal Argument"))

;; Setup "SPC f" keys

(general-create-definer utz/set-leader-f-key
  :wrapping utz/set-leader-key
  :infix "f")

(utz/set-leader-f-key "" '(:ignore t :wk "Files")
  "s" 'save-buffer)

;; Setup "SPC f e" keys

(general-create-definer utz/set-leader-f-e-key
  :wrapping utz/set-leader-key
  :infix "f e")

(utz/set-leader-f-e-key "" '(:ignore t :wk "emacs config")
  "R" 'utz/load-config-file
  "d" 'utz/edit-config-file)

;; Setup "SPC n" keys

(general-create-definer utz/set-leader-n-key
  :wrapping utz/set-leader-key
  :infix "n")

(utz/set-leader-n-key "" '(:ignore t :wk "Narrow / Widen")
  "w" '(widen :wk "Widen")
  "p" '(narrow-to-page :wk "Narrow to Page")
  "r" '(narrow-to-region :wk "Narrow to Region")
  "d" '(narrow-to-defun :wk "Narrow to Function Definition")
  "]" '(utz/narrow-page-forward wk: "Next Page")
  "[" '(utz/narrow-page-backward wk: "Previous Page"))

;; Setup "SPC q" keys

(general-create-definer utz/set-leader-q-key
  :wrapping utz/set-leader-key
  :infix "q")

(utz/set-leader-q-key "" '(:ignore t :wk "Quit/Restart")
		  "q" '(kill-emacs :wk "Kill Emacs"))

;;          _ _
;;  _____ _(_) |
;; / -_) V / | |
;; \___|\_/|_|_|

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
	evil-want-C-u-delete t
	evil-shift-width 2
	evil-indent-convert-tabs nil
	evil-echo-state nil
	evil-normal-state-tag " NORMAL "
	evil-visual-state-tag " VISUAL "
	evil-insert-state-tag " INSERT "
	evil-emacs-state-tag " EMACS "
	evil-replace-state-tag " REPLACE "
	evil-motion-state-tag " MOTION "
	evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-magit
  :after evil magit)

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil)

;;                  _ _
;;  _ __  __ _ __ _(_) |_
;; | '  \/ _` / _` | |  _|
;; |_|_|_\__,_\__, |_|\__|
;;            |___/

(use-package magit
  :general (utz/set-leader-key "g s" 'magit-status
	     "g d" 'magit-dispatch))

;;  _        _       __      _
;; | |_  ___| |_ __ / _|_  _| |
;; | ' \/ -_) | '_ \  _| || | |
;; |_||_\___|_| .__/_|  \_,_|_|
;;            |_|
(use-package helpful
  :general ("C-h f" 'helpful-callable
	    "C-h v" 'helpful-variable
	    "C-h k" 'helpful-key
	    "C-h F" 'helpful-function
	    "C-h c" 'helpful-command)
  (utz/set-leader-key "h f" 'helpful-callable
    "h v" 'helpful-variable
    "h k" 'helpful-key
    "h F" 'helpful-function
    "h c" 'helpful-command))

;;         _    _    _       _
;; __ __ _| |_ (_)__| |_ ___| |_____ _  _
;; \ V  V / ' \| / _| ' \___| / / -_) || |
;;  \_/\_/|_||_|_\__|_||_|  |_\_\___|\_, |
;;                                   |__/

(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;;  _        _
;; | |_  ___| |_ __
;; | ' \/ -_) | '  \
;; |_||_\___|_|_|_|_|

(use-package helm
  :init
  (helm-mode 1)
  :general
  (general-define-key "M-x" '(helm-M-x :wk "M-x"))
  (utz/set-leader-key "SPC" '(helm-M-x :wk "M-x")
    "b m" 'helm-bookmarks)
  (utz/set-leader-f-key "f" '(helm-find-files :wk "Find Files"))
  (utz/set-leader-b-key "b" '(helm-buffers-list :wk "List Buffers")))


;;             _            _
;;  _ _ ___ __| |_ __ _ _ _| |_ ___ ___ _ __  __ _ __ ___
;; | '_/ -_|_-<  _/ _` | '_|  _|___/ -_) '  \/ _` / _(_-<
;; |_| \___/__/\__\__,_|_|  \__|   \___|_|_|_\__,_\__/__/

(use-package restart-emacs
  :general (utz/set-quit-key "r" '(restart-emacs :wk "Restart Emacs")))


;;   __ _         _           _
;;  / _| |_  _ __| |_  ___ __| |__
;; |  _| | || / _| ' \/ -_) _| / /
;; |_| |_|\_, \__|_||_\___\__|_\_\
;;        |__/

(use-package flycheck
  :config
  (global-flycheck-mode))


;;; company
;;  __ ___ _ __  _ __  __ _ _ _ _  _
;; / _/ _ \ '  \| '_ \/ _` | ' \ || |
;; \__\___/_|_|_| .__/\__,_|_||_\_, |
;;              |_|             |__/

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))


;;  _           _
;; | |_ _  _ __| |_ _ __ _
;; | ' \ || / _` | '_/ _` |
;; |_||_\_, \__,_|_| \__,_|
;;      |__/

(use-package hydra
  :defer 2
  :general
  (utz/set-leader-key "c ." 'utz/hydra-comment/body)
  (utz/set-narrow-key "." '(utz/hydra-narrow/body :wk "Transient State")))

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
  ("q" nil "cancel"))

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

;;   __ _      _     _
;;  / _(_)__ _| |___| |_
;; |  _| / _` | / -_)  _|
;; |_| |_\__, |_\___|\__|
;;       |___/

(use-package figlet
  :general (utz/set-leader-key "c f F" 'figlet-comment
	     "c f f" 'figlet
	     "c f r" 'figlet-figletify-region
	     "c f R" 'figlet-figletify-region))

;;  _   _
;; | |_| |_  ___ _ __  ___ ___
;; |  _| ' \/ -_) '  \/ -_|_-<
;;  \__|_||_\___|_|_|_\___/__/

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one-light t)

  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;;  _
;; | |_ _ _ ___ ___ _ __  __ _ __ ___
;; |  _| '_/ -_) -_) '  \/ _` / _(_-<
;;  \__|_| \___\___|_|_|_\__,_\__/__/

(use-package treemacs
  :commands treemacs
  :general (utz/set-leader-key "f t" 'treemacs-select-window))

(use-package treemacs-evil
  :after treemacs evil)

(use-package treemacs-magit
  :after treemacs magit)

;;  _ _ __ _ _ _  __ _ ___ _ _
;; | '_/ _` | ' \/ _` / -_) '_|
;; |_| \__,_|_||_\__, \___|_|
;;               |___/
(use-package ranger
  :commands ranger)

;;  _
;; | |__ _ __
;; | '_ \ '  \
;; |_.__/_|_|_|

(use-package bm
  :demand t
  :init
  (setq bm-restore-repository-on-load t))

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init.el ends here
