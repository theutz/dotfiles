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
(setq doom-font (font-spec :family theutz-font :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family theutz-font :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme theutz-theme)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq theutz-dropbox "~/Dropbox"
      theutz-dropbox-emacs (expand-file-name "emacs" theutz-dropbox))

(defun read-lines (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (split-string (buffer-string) "\n" t)))

(setq org-gcal-client-id (car (read-lines (expand-file-name "gcal_client_id" theutz-dropbox-emacs)))
      org-gcal-client-secret (car (read-lines (expand-file-name "gcal_client_secret" theutz-dropbox-emacs)))
      org-gcal-file-alist '(("michael.utz@smartly.io" . (expand-file-name "schedule.org" org-directory))))

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

;; org-journal files
(add-to-list 'auto-mode-alist '("journal/[0-9]\\\{8\\\}\\'" . org-journal-mode))
(setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'"
      org-agenda-files `(,(expand-file-name org-directory) ,(expand-file-name org-journal-dir org-directory)))

;; org-modules
(add-to-list 'org-modules 'org-habit)

;; org tags
(setq org-tags-persistent-alist '((:startgroup . nil)
                                  ("@work" . ?w) ("@personal" . ?p)
                                  (:endgroup . nil)
                                  ("MacBook" . ?m) ("iPhone" . ?i)))

;; deft
(setq deft-directory (expand-file-name "~/Dropbox/notes"))

;; org-capture
(setq +org-capture-todo-file (expand-file-name "todo.org" org-directory))
(setq org-capture-templates
      '(("t" "Personal todo" entry
         (file +org-capture-todo-file)
         "* TODO %?\n%i\n%a")
        ("n" "Personal notes" entry
         (file+headline +org-capture-notes-file "Inbox")
         "* %u %?\n%i\n%a" :prepend t)
        ("j" "Journal" entry
         (file+olp+datetree +org-capture-journal-file)
         "* %U %?\n%i\n%a" :prepend t)
        ("p" "Templates for projects")
        ("pt" "Project-local todo" entry
         (file+headline +org-capture-project-todo-file "Inbox")
         "* TODO %?\n%i\n%a" :prepend t)
        ("pn" "Project-local notes" entry
         (file+headline +org-capture-project-notes-file "Inbox")
         "* %U %?\n%i\n%a" :prepend t)
        ("pc" "Project-local changelog" entry
         (file+headline +org-capture-project-changelog-file "Unreleased")
         "* %U %?\n%i\n%a" :prepend t)
        ("o" "Centralized templates for projects")
        ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
        ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
        ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)))

;; Config ZSH Files
(let ((config-files-list '("\\.?zshenv\\'"
                           "\\.?zshrc\\'"
                           "\\.?zprofile\\'"
                           "\\.?zlogin\\'"
                           "\\.?zlogout\\'"
                           "\\.?zpreztorc\\'"
                           "yabairc\\'")))
  (dolist (elt config-files-list nil)
    (add-to-list 'auto-mode-alist `(,elt . sh-mode))))

;; LSP Mode
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq! lsp-eslint-validate ["javascript" "javascriptreact" "typescript" "typescriptreact"])
(setq! lsp-yaml-format-enable nil) ; let prettier handle this

;; Fullscreen at startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Open markdown files in Marked 2
(setq markdown-open-command "~/bin/mark")

(defun theutz/doom-what-changed ()
  "Compare the init.el that's in use with what's available in the newest version of doom."
  (interactive)
  (let ((old-file (expand-file-name "init.el" doom-private-dir))
        (new-file (expand-file-name "init.example.el" user-emacs-directory)))
    (ediff old-file new-file)))

(defun theutz/open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    ;; (cfw:org-create-source "Green")  ; org-agenda source
    ;; (cfw:org-create-file-source "cal" "/path/to/cal.org" "Cyan")  ; other org source
    ;; (cfw:howm-create-source "Blue")  ; howm source
    ;; (cfw:cal-create-source "Orange") ; diary source
    ;; (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "Smartly" "https://calendar.google.com/calendar/ical/michael.utz%40smartly.io/private-ebc1bdad8071c23914f4411d2f515d50/basic.ics" "Green")
   )))
