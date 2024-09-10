;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; [[file:config.org::*Identity][Identity:1]]
(setq user-full-name "Michael Utz"
      user-mail-address "michael@theutz.com")
;; Identity:1 ends here

;; [[file:config.org::*Fonts][Fonts:1]]
(setq doom-font (font-spec :family "BlexMono Nerd Font Mono" :size 12 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 12)
      doom-serif-font (font-spec :family "IBM Plex Serif" :size 12 :weight 'medium))
;; Fonts:1 ends here

;; [[file:config.org::*Themes][Themes:1]]
(setq doom-theme-dark 'doom-rose-pine
      doom-theme-light 'doom-rose-pine-dawn
      doom-theme doom-theme-light)

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme doom-theme-light t))
    ('dark (load-theme doom-theme-dark t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
;; Themes:1 ends here

;; [[file:config.org::*Line number style][Line number style:1]]
(setq display-line-numbers-type 'relative)
;; Line number style:1 ends here

;; [[file:config.org::*Server][Server:1]]
(setq server-socket-dir (expand-file-name "emacs" (or (getenv "XDG_STATE_DIR")
                                                      (expand-file-name ".local/state" (getenv "HOME")))))
;; Server:1 ends here

;; [[file:config.org::*Vterm][Vterm:1]]
(setq vterm-shell "/opt/homebrew/bin/nu")
;; Vterm:1 ends here

;; [[file:config.org::*Vterm][Vterm:2]]
(map! :desc "Open terminal" :nvi "C-/" '+vterm/toggle)
;; Vterm:2 ends here

;; [[file:config.org::*Line spacing][Line spacing:1]]
(defvar toggle-line-spacing 0.6
  "Amount of line spacing to use when toggling line spacing")
;; Line spacing:1 ends here

;; [[file:config.org::*Line spacing][Line spacing:2]]
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to a lil extra space"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing toggle-line-spacing))
  (redraw-frame (selected-frame)))
;; Line spacing:2 ends here

;; [[file:config.org::*Line spacing][Line spacing:3]]
(map! :desc "Line spacing" :leader :n "ts" #'toggle-line-spacing)
;; Line spacing:3 ends here

;; [[file:config.org::*Line spacing][Line spacing:4]]
(setq line-spacing toggle-line-spacing)
;; Line spacing:4 ends here

;; [[file:config.org::*Customize][Customize:1]]
(load-file (concat doom-user-dir "custom.el"))
;; Customize:1 ends here

;; [[file:config.org::*Auto Save][Auto Save:1]]
;; (auto-save-visited-mode 1)
;; Auto Save:1 ends here

;; [[file:config.org::*Tree Sitter][Tree Sitter:1]]
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml"))
      major-mode-remap-alist '((php-mode . php-ts-mode)))
;; Tree Sitter:1 ends here

;; [[file:config.org::*evil-snipe][evil-snipe:1]]
(after! evil-snipe
  (setq evil-snipe-scope 'buffer))
;; evil-snipe:1 ends here

;; [[file:config.org::*which-key][which-key:1]]
(after! which-key
  (setq which-key-allow-imprecise-window-fit nil))
;; which-key:1 ends here

;; [[file:config.org::*evil][evil:2]]
(after! evil
  (setq evil-shift-width 2))
;; evil:2 ends here

;; [[file:config.org::*evil-lion][evil-lion:1]]
(after! evil-lion
  (map! :mode org-mode :n "ga" #'evil-lion-left)
  (map! :mode org-mode :n "gl" #'org-down-element))
;; evil-lion:1 ends here

;; [[file:config.org::*just-mode][just-mode:2]]
(use-package! just-mode)
;; just-mode:2 ends here

;; [[file:config.org::*justl][justl:2]]
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
;; justl:2 ends here

;; [[file:config.org::*kdl-mode][kdl-mode:2]]
(use-package! kdl-mode)
;; kdl-mode:2 ends here

;; [[file:config.org::*Package setup][Package setup:2]]
(use-package! nushell-mode
  :mode "\\.nu")
;; Package setup:2 ends here

;; [[file:config.org::define-org-babel-nushell-command][define-org-babel-nushell-command]]
(defvar org-babel-nushell-command
  "nu"
  "The command to execute babel body code.")
;; define-org-babel-nushell-command ends here

;; [[file:config.org::define-org-babel-nushell-config-dir][define-org-babel-nushell-config-dir]]
(defvar org-babel-nushell-config-dir
  (concat (file-name-as-directory (or (getenv "XDG_CONFIG_HOME")
                                      (getenv "HOME" ".config")))
          "nushell/")
  "Absolute path to the root directory where config files for nushell exist.")
;; define-org-babel-nushell-config-dir ends here

;; [[file:config.org::org-babel-define-config-env-file][org-babel-define-config-env-file]]
(defvar org-babel-nushell-env-config-file
  (concat org-babel-nushell-config-dir "env.nu")
  "Absolute path to the nu file used to configure a non-interactive nushell session.")
;; org-babel-define-config-env-file ends here

;; [[file:config.org::org-babel-define-config-file][org-babel-define-config-file]]
(defvar org-babel-nushell-config-file
  (concat org-babel-nushell-config-dir "config.nu")
  "Absolute path to the nu file used to configure an interactive nushell session.")
;; org-babel-define-config-file ends here

;; [[file:config.org::define-org-babel-nushell-command-options][define-org-babel-nushell-command-options]]
(defvar org-babel-nushell-command-options
  (mapconcat 'identity (list "--no-newline"
                            "--env-config"
                            org-babel-nushell-env-config-file
                            "--config"
                            org-babel-nushell-config-file)
            " ")
  "The command options to use when executing code")
;; define-org-babel-nushell-command-options ends here

;; [[file:config.org::*The execute function][The execute function:1]]
(defun org-babel-execute:nushell (body params)
  "Orgmode Babel NuShell evaluate function for `BODY' with `PARAMS'."
  (let* ((tmp-src-file (org-babel-temp-file "nu-src-" ".nu"))
         (processed-params (org-babel-process-params params))
         (flags (cdr (assoc :flags processed-params)))
         (args (cdr (assoc :args processed-params)))
         (full-body (org-babel-expand-body:nushell
                     body params processed-params))
         (coding-system-for-read 'utf-8)
         (coding-system-for-write 'utf-8))
    (with-temp-file tmp-src-file (insert full-body))
    (org-babel-eval (format "%s %s %s"
                            org-babel-nushell-command
                            org-babel-nushell-command-options
                            (org-babel-process-file-name tmp-src-file)) "")))
;; The execute function:1 ends here

;; [[file:config.org::*The execute function][The execute function:2]]
(defun org-babel-expand-body:nushell (body params &optional processed-params)
  "Expand BODY according to PARAMS, return the expanded body."
  (let* ((vars (org-babel--get-vars params)))
    (org-babel-nushell-custom-vars vars body)))
;; The execute function:2 ends here

;; [[file:config.org::*Concatenating with body][Concatenating with body:1]]
(defun org-babel-nushell-custom-vars (params body)
  "Append custom variables at top."
  (if (= (length params) 0)
      body
    (concat (mapconcat 'org-babel-nushell-var-to-nushell params "\n") "\n" body)))
;; Concatenating with body:1 ends here

;; [[file:config.org::*Parsing individual parameters][Parsing individual parameters:1]]
(defun org-babel-nushell-var-to-nushell (pair)
  "Convert an elisp var into a string of go source code
specifying a var of the same value."
  (let* ((var (car pair))
         (val (cdr pair)))
    (when (symbolp val)
      (setq val (symbol-name val)))
    (while (string-match-p "\n\\'" val)
      (setq val (substring val 0 -1)))
    (format "let %S = %S" var val)))
;; Parsing individual parameters:1 ends here

;; [[file:config.org::*rose-doom-pine-emacs][rose-doom-pine-emacs:2]]
(defun doom-rose-pine-install ()
  "Copy theme files from straight repo to themes dir."
  (let* ((themes '("rose-pine"
                   "rose-pine-dawn"
                   "rose-pine-moon"))
         (suffix "-theme.el")
         (prefix (concat straight-base-dir "straight/repos/rose-pine-doom-emacs/doom-"))
         (theme-dir (concat doom-user-dir "themes/"))
         (files (mapcar (lambda (item) (concat prefix item suffix)) themes)))
    (unless (file-exists-p theme-dir)
      (make-directory theme-dir t))
    (dolist (file files)
      (when (file-exists-p file)
        (copy-file file theme-dir t)))))
(add-hook! 'doom-before-reload-hook 'doom-rose-pine-install)
;; rose-doom-pine-emacs:2 ends here

;; [[file:config.org::*gptel][gptel:2]]
(use-package! gptel
  :config
  (setq gptel-model "gpt-4")
  (add-hook! 'gptel-post-stream-hook 'gptel-auto-scroll)
  (add-hook! 'gptel-post-response-functions 'gptel-end-of-response)
  (map! :leader
        :desc "Open GPT"
        :n "og"
        #'gptel)
  (map! :localleader
        :mode gptel-mode
        :desc "Send prompt"
        :n "RET"
        #'gptel-send)
  (map! :localleader
        :mode gptel-mode
        :desc "Open gpt menu"
        :n "SPC"
        #'gptel-menu))
;; gptel:2 ends here

;; [[file:config.org::*chezmoi.el][chezmoi.el:2]]
(use-package! chezmoi
  :config
  (let ((base "fz"))
    (map! :leader :desc "chezmoi" :n base)
    (map! :leader :desc "Find in chezmoi" :n (concat base "f") #'chezmoi-find)
    (map! :leader :desc "Write to chezmoi" :n (concat base "s") #'chezmoi-write)
    (map! :leader :desc "Sync with chezmoi" :n (concat base "t") #'chezmoi-mode)
    (map! :leader :desc "Chezmoi git status" :n (concat base "o") #'chezmoi-open-other)))
;; chezmoi.el:2 ends here

;; [[file:config.org::*ox-gfm][ox-gfm:2]]
(use-package! ox-gfm :after org)
;; ox-gfm:2 ends here

;; [[file:config.org::*grip-mode][grip-mode:2]]
(use-package! grip-mode
  ;; :hook ((markdown-mode org-mode) . grip-mode)
  :config
  (let ((credential (auth-source-user-and-password "api.github.com" "theutz")))
    (setq grip-github-user (car credential)
          grip-github-password (cadr credential)))
  (map! :mode org-mode :localleader :n "E" #'grip-browse-preview))
;; grip-mode:2 ends here

;; [[file:config.org::*hydra][hydra:2]]
(use-package! hydra
  :config
  (defhydra doom-window-resize-hydra (:hint nil)
    "
Resize window

        _k_ +height
  _h_ -width     _l_ +width
        _j_ -height
"
    ("h" evil-window-decrease-width)
    ("j" evil-window-decrease-height)
    ("k" evil-window-increase-height)
    ("l" evil-window-increase-width)
    ("q" nil))
  (map! :leader :prefix "w" :desc "resize windows" :n "SPC" #'doom-window-resize-hydra/body))
;; hydra:2 ends here

;; [[file:config.org::*multi-vterm][multi-vterm:2]]
(use-package! multi-vterm
  :config
  (map! :localleader :mode vterm-mode :n "c" #'multi-vterm)
  (map! :localleader :mode vterm-mode :n "n" #'multi-vterm-next)
  (map! :localleader :mode vterm-mode :n "p" #'multi-vterm-prev))
;; multi-vterm:2 ends here

;; [[file:config.org::*Pre-load][Pre-load:1]]
(setq org-directory "~/Dropbox/org/")
;; Pre-load:1 ends here

;; [[file:config.org::*Post-load][Post-load:1]]
(after! org
  (add-to-list 'org-modules 'org-habit))
;; Post-load:1 ends here

;; [[file:config.org::*Post-load][Post-load:2]]
(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"             ; A task that needs doing & is ready to do
           "PROJ(p)"             ; A project, which usually contains other tasks
           "LOOP(r)"             ; A recurring task
           "STRT(s)"             ; A task that is in progress
           "WAIT(w)"             ; Something external is holding up this task
           "HOLD(h)"             ; This task is paused/on hold because of me
           "IDEA(i)"             ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"   ; Task successfully completed
           "KILL(k)")  ; Task was cancelled, aborted, or is no longer applicable
          (sequence
           "[ ](T)"                     ; A task that needs doing
           "[-](S)"                     ; Task is in progress
           "[?](W)"                     ; Task is being held up or paused
           "|"
           "[X](D)")                    ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)"))
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("KILL" . +org-todo-cancel))))
;; Post-load:2 ends here

;; [[file:config.org::*Post-load][Post-load:3]]
(after! org
  (map! :mode org-mode :n "gj" #'org-forward-element)
  (map! :mode org-mode :n "gk" #'org-backward-element)
  (map! :localleader :mode org-mode :desc "columns" :n "m")
  (map! :localleader :mode org-mode :desc "org-columns" :n "mm" #'org-columns)
  (map! :localleader :mode org-mode :desc "org-columns-quit" :n "mq" #'org-columns-quit)
  (map! :localleader :mode org-mode :desc "org-refile-copy" :n "rd" #'org-refile-copy)
  (map! :localleader :mode org-mode :desc "org-delete-property" :n "O" #'org-delete-property))
;; Post-load:3 ends here

;; [[file:config.org::*Post-load][Post-load:4]]
(defun my/org-faces ()
  "Define custom fonts for org mode."
  (let ((h1 1.476)
        (h2 1.383)
        (h3 1.296)
        (h4 1.215)
        (h5 1.138)
        (h6 1.067)
        (p 1.0)
        (small 0.937)
        (tiny 0.878))
    (set-face-attribute 'org-level-1 nil :height h2)
    (set-face-attribute 'org-level-2 nil :height h3)
    (set-face-attribute 'org-level-3 nil :height h4)
    (set-face-attribute 'org-level-4 nil :height h5)
    (set-face-attribute 'org-level-5 nil :height h6)
    (set-face-attribute 'org-level-6 nil :height h6)
    (set-face-attribute 'org-level-7 nil :height h6)
    (set-face-attribute 'org-level-8 nil :height h6)
    (set-face-attribute 'org-document-title nil :height h1)
    (set-face-attribute 'org-block-begin-line nil :height small)
    (set-face-attribute 'org-block-end-line nil :height small))
  (setq-local line-spacing 0.16))

(add-hook! org-mode #'my/org-faces)
;; Post-load:4 ends here

;; [[file:config.org::*nix-mode][nix-mode:1]]
(after! nix-mode
  (set-formatter! 'alejandra '("alejandra" "--quiet") :modes '(nix-mode)))
;; nix-mode:1 ends here

;; [[file:config.org::*nix-mode][nix-mode:2]]
(setq-hook! 'nix-mode-hook +format-with-lsp nil)
;; nix-mode:2 ends here

;; [[file:config.org::*yaml-mode][yaml-mode:1]]
(after! yaml-mode
  (set-formatter! 'prettierd '("/opt/homebrew/bin/prettierd") :modes '(yaml-mode)))
;; yaml-mode:1 ends here

;; [[file:config.org::*woman-mode][woman-mode:1]]
(setq woman-fill-frame t)
;; woman-mode:1 ends here

;; [[file:config.org::*Workspaces][Workspaces:1]]
(map! :leader
      (:when (modulep! :ui workspaces)
        (:prefix-map ("TAB" . "workspace")
         :desc "Prev workspace" "p" #'+workspace/switch-left
         :desc "Next workspace" "n" #'+workspace/switch-right
         :desc "Create workspace" "c" #'+workspace/new
         :desc "Swap workspace left" "<" #'+workspace/swap-left
         :desc "Swap workspace right" ">" #'+workspace/swap-right)))
;; Workspaces:1 ends here

;; [[file:config.org::*Bindings][Bindings:1]]
(map! :leader :desc "Find file" :n "e" 'find-file)
;; Bindings:1 ends here
