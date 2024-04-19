;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Michael Utz"
      user-mail-address "michael@theutz.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "BlexMono Nerd Font Mono" :size 16 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;
;; Evil Mode
;;
(after! evil-snipe
  (setq evil-snipe-scope 'buffer))

;;
;; GPTel
;;
(use-package! gptel
  :config
  (map! :leader
        :desc "Open GPT"
        :n "og"
        #'gptel)
  (map! :localleader
        :map gptel-mode-map
        :desc "Send Prompt"
        :n "RET"
        #'gptel-send)
  (add-hook! 'gptel-post-stream-hook 'gptel-auto-scroll)
  (add-hook! 'gptel-post-response-functions 'gptel-end-of-response))

;;
;; Org Mode
;;
(after! org
  (setq +org-capture-todo-file "inbox.org"
        org-capture-templates '(("t" "Personal todo" entry
                                 (file +org-capture-todo-file)
                                 "* TODO %?\n%i\n%a" :prepend t)
                                ("n" "Personal notes" entry
                                 (file+headline +org-capture-notes-file "Inbox")
                                 "* %u %?\n%i\n%a" :prepend t)
                                ("j" "Journal" entry
                                 (file+olp+datetree +org-capture-journal-file)
                                 "* %U %?\n%i\n%a" :prepend t)

                                ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
                                ;; {todo,notes,changelog}.org file is found in a parent directory.
                                ;; Uses the basename from `+org-capture-todo-file',
                                ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
                                ("p" "Templates for projects")
                                ("pt" "Project-local todo" entry   ; {project-root}/todo.org
                                 (file+headline +org-capture-project-todo-file "Inbox")
                                 "* TODO %?\n%i\n%a" :prepend t)
                                ("pn" "Project-local notes" entry  ; {project-root}/notes.org
                                 (file+headline +org-capture-project-notes-file "Inbox")
                                 "* %U %?\n%i\n%a" :prepend t)
                                ("pc" "Project-local changelog" entry ; {project-root}/changelog.org
                                 (file+headline +org-capture-project-changelog-file "Unreleased")
                                 "* %U %?\n%i\n%a" :prepend t)

                                ;; Will use {org-directory}/{+org-capture-projects-file} and store
                                ;; these under {ProjectName}/{Tasks,Notes,Changelog} headings. They
                                ;; support `:parents' to specify what headings to put them under, e.g.
                                ;; :parents ("Projects")
                                ("o" "Centralized templates for projects")
                                ("ot" "Project todo" entry
                                 (function +org-capture-central-project-todo-file)
                                 "* TODO %?\n %i\n %a"
                                 :heading "Tasks"
                                 :prepend nil)
                                ("on" "Project notes" entry
                                 (function +org-capture-central-project-notes-file)
                                 "* %U %?\n %i\n %a"
                                 :heading "Notes"
                                 :prepend t)
                                ("oc" "Project changelog" entry
                                 (function +org-capture-central-project-changelog-file)
                                 "* %U %?\n %i\n %a"
                                 :heading "Changelog"
                                 :prepend t))))

;;
;; Which Key
;;
(after! which-key
  (setq which-key-allow-imprecise-window-fit t))

;;
;; Just
;;
(use-package! just-mode)
(use-package! justl
  :config
  (let ((desc "Execute recipe")
        (fn 'justl-exec-recipe))
    (map! :desc desc
          :map just-mode-map
          :n "e"
          fn)
    (map! :desc desc
          :n "e"
          fn)))

;;
;; Emacs
;;
(setq server-socket-dir
      (concat (getenv "XDG_RUNTIME_DIR") "emacs"))

;;
;; Line Spacing
;;
(defvar theutz-line-spacing 0.5
  "Amount of line spacing to use when toggling line spacing")

(defun theutz-toggle-line-spacing ()
  "Toggle line spacing between no extra space to a lil extra space"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing theutz-line-spacing))
  (redraw-frame (selected-frame)))

(map! :desc "Line spacing"
      :leader
      :n "ts"
      #'theutz-toggle-line-spacing)

(setq theutz-line-spacing 0.3)

;;
;; kdl
;;
(use-package! kdl-mode)
