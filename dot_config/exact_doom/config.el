;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; [[file:config.org::*Identity][Identity:1]]
(setq user-full-name "Michael Utz"
      user-mail-address "michael@theutz.com")
;; Identity:1 ends here

;; [[file:config.org::*Fonts][Fonts:1]]
(setq doom-font (font-spec :family "BlexMono Nerd Font Mono" :size 16 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14))
;; Fonts:1 ends here

;; [[file:config.org::*Themes][Themes:1]]
(setq doom-theme 'doom-horizon)
;; Themes:1 ends here

;; [[file:config.org::*Line Number Style][Line Number Style:1]]
(setq display-line-numbers-type 'relative)
;; Line Number Style:1 ends here

;; [[file:config.org::*Server][Server:1]]
(setq server-socket-dir (concat (getenv "XDG_RUNTIME_DIR") "emacs"))
;; Server:1 ends here

;; [[file:config.org::*vterm][vterm:1]]
(setq vterm-shell "/opt/homebrew/bin/nu")
;; vterm:1 ends here

;; [[file:config.org::*Local variables][Local variables:1]]
(setq safe-local-variable-values '((line-spacing . 0.5)))
;; Local variables:1 ends here

;; [[file:config.org::*Local variables][Local variables:2]]
(setq safe-local-eval-forms
      (add-hook 'after-save-hook
                (lambda () (if (y-or-n-p "Tangle?")
                          (org-babel-tangle))) nil t))
;; Local variables:2 ends here

;; [[file:config.org::*Line spacing][Line spacing:1]]
(defvar theutz-line-spacing 0.3
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
;; Line spacing:1 ends here

;; [[file:config.org::*evil-snipe][evil-snipe:1]]
(after! evil-snipe
  (setq evil-snipe-scope 'buffer))
;; evil-snipe:1 ends here

;; [[file:config.org::*which-key][which-key:1]]
(after! which-key
  (setq which-key-allow-imprecise-window-fit nil))
;; which-key:1 ends here

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

;; [[file:config.org::*nushell-mode][nushell-mode:2]]
(use-package! nushell-mode
  :mode "\\.nu")
;; nushell-mode:2 ends here

;; [[file:config.org::*nushell-mode][nushell-mode:3]]
(defvar org-babel-nushell-command
  "nu"
  "The command to execute babel body code.")

(defvar org-babel-nushell-command-options
  "--login --env-config /Users/michael/.config/nushell/env.nu --config /Users/michael/.config/nushell/config.nu"
  "The command options to use when executing code")

(defun org-babel-execute:nushell (body params)
  "Orgmode Babel NuShell evaluate function for `BODY' with `PARAMS'."
  (let ((tmp-src-file (org-babel-temp-file "nu-src-" ".nu")))
    (with-temp-file tmp-src-file (insert body))
    (org-babel-eval (format "%s %s %s"
                            org-babel-nushell-command
                            org-babel-nushell-command-options
                            (org-babel-process-file-name tmp-src-file)) "")))
;; nushell-mode:3 ends here

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

;; [[file:config.org::*Org][Org:1]]
(after! org
  (add-to-list 'org-modules 'org-habit)
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
          ("KILL" . +org-todo-cancel)))
  (map! :localleader
        :mode org-mode
        :desc "org-columns"
        :n "m"
        #'org-columns)
  (map! :localleader
        :mode org-mode
        :desc "org-refile-copy"
        :n "rd"
        #'org-refile-copy))
;; Org:1 ends here

;; [[file:config.org::*Nix][Nix:1]]
(after! nix-mode
  (set-formatter! 'alejandra '("alejandra" "--quiet") :modes '(nix-mode)))
;; Nix:1 ends here

;; [[file:config.org::*Nix][Nix:2]]
(setq-hook! 'nix-mode-hook +format-with-lsp nil)
;; Nix:2 ends here

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

;; [[file:config.org::*LazyVim compatibility layer][LazyVim compatibility layer:1]]
(map! :leader :desc "Find file" :n "e" 'find-file)
;; LazyVim compatibility layer:1 ends here

;; [[file:config.org::*LazyVim compatibility layer][LazyVim compatibility layer:2]]
(map! :desc "Open terminal" :nvi "C-/" '+vterm/toggle)
;; LazyVim compatibility layer:2 ends here
