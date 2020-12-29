;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(load! "lisp/autoload")

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
(load! "lisp/fonts")
(setq doom-font (font-spec :family theutz-font :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family theutz-font :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(load! "lisp/themes")
(setq doom-theme theutz-theme)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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

;;
;; Org
;;
(load! "lisp/org")

;;
;; Config ZSH Files
;;
(let ((config-files-list '("\\.?zshenv\\'"
                           "\\.?zshrc\\'"
                           "\\.?zprofile\\'"
                           "\\.?zlogin\\'"
                           "\\.?zlogout\\'"
                           "\\.?zpreztorc\\'"
                           "yabairc\\'")))
  (dolist (elt config-files-list nil)
    (add-to-list 'auto-mode-alist `(,elt . sh-mode))))

;;
;; LSP Mode
;;
(setq! +format-with-lsp nil)
(setq! lsp-eslint-validate ["javascript" "javascriptreact" "typescript" "typescriptreact"])
(setq! lsp-yaml-format-enable nil) ; let prettier handle this

;;
;; Fullscreen at startup
;;
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;
;; Open markdown files in Marked 2
;;
(setq markdown-open-command "~/bin/mark")

;;
;; Encryption
;;
(setq! epa-file-cache-passphrase-for-symmetric-encryption t)

;;
;; Ranger
;;
(map! :leader :desc "Open in Ranger" :n "f v" 'ranger)

;;
;; Disable Quits
;;
(map! :desc "Delete Frame" :g "s-q" 'doom/delete-frame-with-prompt)
(evil-ex-define-cmd "q" 'doom/delete-frame-with-prompt)

;;
;; VTerm
;;
(setq! vterm-max-scrollback 100000)
