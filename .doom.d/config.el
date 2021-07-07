;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Michael Utz"
      user-mail-address "michael@theutz.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "IBM Plex Mono" :size 12)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;----------------------- My Config -------------------------------------------

;; Line Spacing
(setq utz-line-spacing 0.3)
(setq-default line-spacing utz-line-spacing)
(defun utz/toggle-line-spacing ()
  "Toggle line spacing"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing utz-line-spacing))
  (redraw-frame (selected-frame)))
(map! :leader :desc "Line spacing" :n "tl" #'utz/toggle-line-spacing)

;; turn on packages

;; Use magit for yadm
(require 'tramp)
(add-to-list 'tramp-methods
             '("yadm"
               (tramp-login-program "yadm")
               (tramp-login-args (("enter")))
               (tramp-login-env (("SHELL") ("/bin/sh")))
               (tramp-remote-shell "/bin/sh")
               (tramp-remote-shell-args "-c")))

;; Set frame maximized at startup
(dolist (l '(initial-frame-alist
             default-frame-alist))
  (add-to-list l '(fullscreen . maximized)))

;; Setup centaur-tabs keyboard shortcuts
(map! :leader :desc "Next Tab" :n "]" #'centaur-tabs-forward)
(map! :leader :desc "Previous Tab" :n "[" #'centaur-tabs-backward)
(map! :leader :desc "Next Tab Group" :n "}" #'centaur-tabs-forward-group)
(map! :leader :desc "Previous Tab Group" :n "{" #'centaur-tabs-backward-group)
(map! :leader :desc "Switch Tab Group" :n "T" #'centaur-tabs-counsel-switch-group)
(setq centaur-tabs-set-icons t)

;; Setup evil-snipe
(setq evil-snipe-spillover-scope 'buffer)

;; Magit keys
(defun utz/yadm-magit-status ()
  (interactive)
  (magit-status "/yadm::"))

(map! :leader :desc "YADM Status" :n "gd" #'utz/yadm-magit-status)

;; Always revert files to what they are on disk to avoid having emacs ask for it
;; when changing files via git
(global-auto-revert-mode)

;; Keychain Environment
(require 'keychain-environment)
(use-package! keychain-environment
  :config
  (keychain-refresh-environment))

;; Forge
(use-package forge
  :after magit)

;; Add node_modules to exec path
(use-package! add-node-modules-path
  :hook ((js2-mode typescript-mode)) . #'add-node-modules-path)

;; Eslint for faaster formatting
(use-package! eslintd-fix
  :hook ((js2-mode typescript-mode) . #'eslintd-fix-mode))
