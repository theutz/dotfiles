- [Init](#orgd818074)
- [Doom basics](#orgd29567e)
  - [Prologue](#orgdb127a9)
  - [Identity](#org820e32f)
  - [Fonts](#org12e6d08)
  - [Themes](#orgc6b6a51)
  - [Line Number Style](#org40ca5c1)
- [My customizations](#orgde8babc)
  - [Doom Info](#org1ed9342)
  - [Emacs](#org5949ef7)
    - [Server](#org1483de6)
    - [Vterm](#orga47f7a8)
    - [Line spacing](#org7d16581)
    - [Customize](#org9093e26)
    - [Auto Save](#orgfb9347e)
  - [Packages](#orgdf93c7f)
    - [Introduction](#orga80e5ef)
    - [Doom overrrides](#org6a9a62f)
    - [Custom packages](#org692aaf1)
  - [Modes](#org3106f99)
    - [Org](#org6779fea)
    - [Nix](#orgef629c9)
    - [YAML](#orgd2c7873)
  - [Bindings](#orgd688c82)
    - [Doom Overrides&#x2026;](#org1818f7e)
    - [LazyVim compatibility layer](#org94bbd19)



<a id="orgd818074"></a>

# Init

Because I wanted this all to live together in peace and harmony.

```emacs-lisp
;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(setq evil-respect-visual-line-mode t)

(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company           ; the ultimate code completion backend
       ;;(corfu +orderless)  ; complete with cap(f), cape and a flying feather!
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       ;;ivy               ; a search engine for love and life
       (vertico +icons)           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       ;;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ;;nav-flash         ; blink cursor line after big motions
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       ;;tabs              ; a tab bar for Emacs
       ;;treemacs          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       lispy             ; vim for lisp, for people who don't like vim
       ;;multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       (ibuffer +icons)         ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;(spell +flyspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;collab            ; buffers with friends
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       (docker +lsp)
       editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       (magit +forge)             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       (terraform +lsp)         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       tree-sitter       ; syntax and parsing, sitting in a tree...
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       ;;(cc +lsp)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       (go +lsp +tree-sitter)         ; the hipster dialect
       (graphql +lsp)    ; Give queries a REST
       ;;(haskell +lsp)    ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       (json +tree-sitter +lsp)              ; At least it ain't XML
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       (javascript +tree-sitter +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       (lua +lsp +tree-sitter)               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       (nix +lsp +tree-sitter)               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org +pretty)               ; organize your plain life in plain text
       (php +tree-sitter +lsp)               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python +lsp +tree-sitter +pyright)            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       (rest +jq)              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp +tree-sitter)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       (sh +tree-sitter +lsp)                ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       (web +lsp +tree-sitter)               ; the tubes
       (yaml +lsp +tree-sitter)              ; JSON, but readable
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       literate
       (default +bindings +smartparens))
```


<a id="orgd29567e"></a>

# Doom basics


<a id="orgdb127a9"></a>

## Prologue

```emacs-lisp
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
```

Place your private configuration here! Remember, you do not need to run `doom sync` after modifying this file!


<a id="org820e32f"></a>

## Identity

Some functionality uses this to identify you, e.g. GPG configuration, email clients, file templates and snippets. It is optional.

```emacs-lisp
(setq user-full-name "Michael Utz"
      user-mail-address "michael@theutz.com")
```


<a id="org12e6d08"></a>

## Fonts

Doom exposes five (optional) variables for controlling fonts in Doom:

-   **`doom-font`:** the primary font to use
-   **`doom-variable-pitch-font`:** a non-monospace font (where applicable)
-   **`doom-big-font`:** used for `doom-big-font-mode`; use this for presentations or streaming.
-   **`doom-symbol-font`:** for symbols
-   **`doom-serif-font`:** for the `fixed-pitch-serif` face

See `C-h v doom-font` for documentation and more examples of what they accept. For example:

```emacs-lisp
(setq doom-font (font-spec :family "BlexMono Nerd Font Mono" :size 14 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14)
      doom-serif-font (font-spec :family "IBM Plex Serif" :size 14 :weight 'medium))
```

If you or Emacs can&rsquo;t find your font, use `M-x describe-font` to look them up, `M-x eval-region` to execute elisp code, and `M-x doom/reload-font` to refresh your font settings. If Emacs still can&rsquo;t find your font, it likely wasn&rsquo;t installed correctly. Font issues are rarely Doom issues!


<a id="orgc6b6a51"></a>

## Themes

There are two ways to load a theme. Both assume the theme is installed and available. You can either set \`doom-theme&rsquo; or manually load a theme with the \`load-theme&rsquo; function. This is the default:

```emacs-lisp
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
```


<a id="org40ca5c1"></a>

## Line Number Style

This determines the style of line numbers in effect. If set to \`nil&rsquo;, line numbers are disabled. For relative line numbers, set this to \`relative&rsquo;.

```emacs-lisp
(setq display-line-numbers-type 'relative)
```


<a id="orgde8babc"></a>

# My customizations


<a id="org1ed9342"></a>

## Doom Info

Whenever you reconfigure a package, make sure to wrap your config in an `after!` block, otherwise Doom&rsquo;s defaults may override your settings. E.g.

```emacs-lisp
(after! PACKAGE
  (setq x y))
```

The exceptions to this rule:

-   Setting file/directory variables (like `org-directory`)
-   Setting variables which explicitly tell you to set them before their package is loaded (see `C-h v VARIABLE` to look up their documentation).
-   Setting doom variables (which start with `doom-` or `+`).

Here are some additional functions/macros that will help you configure Doom.

-   `load!` for loading external \*.el files relative to this one
-   `use-package!` for configuring packages
-   `after!` for running code after a package has loaded
-   `add-load-path!` for adding directories to the `load-path`, relative to this file. Emacs searches the `load-path` when you load packages with `require` or `use-package`.
-   `map!` for binding new keys

To get information about any of these functions/macros, move the cursor over the highlighted symbol at press `K` (non-evil users must press `C-c c k`). This will open documentation for it, including demos of how they are used. Alternatively, use `C-h o` to look up a symbol (functions, variables, faces, etc).

You can also try `gd` (or `C-c c d`) to jump to their definition and see how they are implemented.


<a id="org5949ef7"></a>

## Emacs


<a id="org1483de6"></a>

### Server

I&rsquo;ve set the corresponding environment variable in my `.zshenv` and `env.nu` files, so this should work without having.

```emacs-lisp
(setq server-socket-dir (concat (or (getenv "XDG_RUNTIME_DIR")
                                    (getenv "TMPDIR")) "emacs"))

```


<a id="orga47f7a8"></a>

### Vterm

```emacs-lisp
(setq vterm-shell "/opt/homebrew/bin/nu")
```


<a id="org7d16581"></a>

### Line spacing

Some useful tools for toggling line spacing. You can press `SPC t s` to toggle big or small spacing. Additionally, you can configure the amount of spacing that is toggled.

Firstly, I&rsquo;ll setup a user defined variable that I&rsquo;ll use to change the line spacing.

```emacs-lisp
(defvar toggle-line-spacing 0.6
  "Amount of line spacing to use when toggling line spacing")
```

Next, of course, we setup the actual function that does the toggling.

```emacs-lisp
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to a lil extra space"
  (interactive)
  (if line-spacing
      (setq line-spacing nil)
    (setq line-spacing toggle-line-spacing))
  (redraw-frame (selected-frame)))
```

And what&rsquo;s the point of all this if there&rsquo;s no keymap?

```emacs-lisp
(map! :desc "Line spacing" :leader :n "ts" #'toggle-line-spacing)
```

Finally, I&rsquo;ll set the default value for line spacing.

```emacs-lisp
(setq line-spacing toggle-line-spacing)
```


<a id="org9093e26"></a>

### Customize

While I&rsquo;m generally avoiding the use of Emacs &ldquo;customization&rdquo; features, it is highly convenient for two things: adding safe local variables and safe local eval forms. So, I will be loading it here.

```emacs-lisp
(load-file (concat doom-user-dir "custom.el"))
```


<a id="orgfb9347e"></a>

### Auto Save

I want my stuff saved as frequently as possible. This saves it automatically into the visited file.

```emacs-lisp
(auto-save-visited-mode 1)
```


<a id="orgdf93c7f"></a>

## Packages


<a id="orga80e5ef"></a>

### Introduction

To install a package with Doom you must declare them here and run &rsquo;doom sync&rsquo; on the command line, then restart Emacs for the changes to take effect &#x2013; or use &rsquo;M-x doom/reload&rsquo;.

To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:

```emacs-lisp
(package! some-package)
```

To install a package directly from a remote git repo, you must specify a \`:recipe&rsquo;. You&rsquo;ll find documentation on what \`:recipe&rsquo; accepts here: <https://github.com/radian-software/straight.el#the-recipe-format>

```emacs-lisp
(package! another-package
  :recipe (:host github :repo "username/repo"))
```

If the package you are trying to install does not contain a PACKAGENAME.el file, or is located in a subdirectory of the repo, you&rsquo;ll need to specify \`:files&rsquo; in the \`:recipe&rsquo;:

```emacs-lisp
(package! this-package
  :recipe (:host github :repo "username/repo"
           :files ("some-file.el" "src/lisp/*.el")))
```

If you&rsquo;d like to disable a package included with Doom, you can do so here with the \`:disable&rsquo; property:

```emacs-lisp
(package! builtin-package :disable t)
```

You can override the recipe of a built in package without having to specify all the properties for \`:recipe&rsquo;. These will inherit the rest of its recipe from Doom or MELPA/ELPA/Emacsmirror:

```emacs-lisp
(package! builtin-package :recipe (:nonrecursive t))
(package! builtin-package-2 :recipe (:repo "myfork/package"))
```

Specify a \`:branch&rsquo; to install a package from a particular branch or tag. This is required for some packages whose default branch isn&rsquo;t &rsquo;master&rsquo; (which our package manager can&rsquo;t deal with; see radian-software/straight.el#279)

```emacs-lisp
(package! builtin-package :recipe (:branch "develop"))
```

Use \`:pin&rsquo; to specify a particular commit to install.

```emacs-lisp
(package! builtin-package :pin "1a2b3c4d5e")
```

Doom&rsquo;s packages are pinned to a specific commit and updated from release to release. The \`unpin!&rsquo; macro allows you to unpin single packages&#x2026;

```emacs-lisp
(unpin! pinned-package)
```

&#x2026;or multiple packages

```emacs-lisp
(unpin! pinned-package another-pinned-package)
```

&#x2026;Or **all** packages (NOT RECOMMENDED; will likely break things)

```emacs-lisp
(unpin! t)
```


<a id="org6a9a62f"></a>

### Doom overrrides

1.  evil-snipe

    ```emacs-lisp
    (after! evil-snipe
      (setq evil-snipe-scope 'buffer))
    ```

2.  which-key

    ```emacs-lisp
    (after! which-key
      (setq which-key-allow-imprecise-window-fit nil))
    ```

3.  evil

    To get evil to respect visual line mode, you&rsquo;ve gotta delcare it early in the `init.el` file.
    
    ```emacs-lisp
    (setq evil-respect-visual-line-mode t)
    ```
    
    But other variables need to be setup after evil loads.
    
    ```emacs-lisp
    (after! evil
      (setq evil-shift-width 2))
    ```

4.  evil-lion

    I like the idea of aligning stuff easily, but in org-mode, consistent navigation keys are better.
    
    ```emacs-lisp
    (after! evil-lion
      (map! :mode org-mode :n "ga" #'evil-lion-left)
      (map! :mode org-mode :n "gl" #'org-down-element))
    ```


<a id="org692aaf1"></a>

### Custom packages

I&rsquo;ll add an obligatory header to the file so we don&rsquo;t byte compile this.

```emacs-lisp
;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
```

Now we can start adding custom packages

1.  just-mode

    This package provides a basic minor mode for interacting with a `Justfile`.
    
    ```emacs-lisp
    (package! just-mode)
    ```
    
    It requires minimal configuration.
    
    ```emacs-lisp
    (use-package! just-mode)
    ```

2.  justl

    This package creates a listing of public Just commands and lets you execute them in a compilation buffer.
    
    ```emacs-lisp
    (package! justl)
    ```
    
    I&rsquo;ve assigned some keymaps to make this more convenient.
    
    ```emacs-lisp
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
    ```

3.  kdl-mode

    KDL is a configuration language favored by some (mostly Rust-based) programs like [Zellij](https://zellij.dev/). This provides basic syntax highlighting for it.
    
    ```emacs-lisp
    (package! kdl-mode
      :recipe (:host github
               :repo "bobuk/kdl-mode"
               :branch "main"))
    ```
    
    It requires almost no configuration to use
    
    ```emacs-lisp
    (use-package! kdl-mode)
    ```

4.  nushell-mode

    1.  Package setup
    
        This little package provides some syntax highlighting.
        
        ```emacs-lisp
        (package! nushell-mode
          :recipe (:host github
                   :repo "mrkkrp/nushell-mode"))
        ```
        
        And requires very little configuration.
        
        ```emacs-lisp
        (use-package! nushell-mode
          :mode "\\.nu")
        ```
    
    2.  org-babel functions
    
        1.  Tangling
        
            I need there to be a blank line between the output from `:comments link` and the actual content of a block. `org-babel-tangle-body-hook` seems like it might be a good candidate to accomplish that.
            
            ```emacs-lisp
            (defun my/nushell-tangle-formatter ()
              "Format tangled output of nushell blocks."
              (save-excursion
                (goto-char (point-min))
                (while (search-forward-regexp "^# \\[\\[file:" nil t)
                  (end-of-line)
                  (insert "\n")
                  (save-excursion
                    (search-forward-regexp "^# .*?:[[:digit:]]+ ends here$" nil t)
                    (beginning-of-line)
                    (insert "\n"))))
              (save-buffer))
            
            (defun my/nushell-post-tangle-hook ()
              "Only run this function when we've detectd a nushell file."
              (when (string= (file-name-extension (buffer-file-name)) "nu")
                (my/nushell-tangle-formatter)))
            
            (add-hook! 'org-babel-post-tangle-hook #'my/nushell-post-tangle-hook)
            ```
        
        2.  User-defined variables
        
            I want nushell to work with org-babel, but nobody&rsquo;s done the dirty work yet. We&rsquo;ll start with the basics. We might want this command to be customizable for someone&rsquo;s environment.
            
            -   `org-babel-nushell-command`
                
                ```emacs-lisp
                  (defvar org-babel-nushell-command
                    "nu"
                    "The command to execute babel body code.")
                ```
                
                ```emacs-lisp
                  org-babel-nushell-command
                ```
            
            Additionally, since I can&rsquo;t be certain the specific environment emacs will be running this command in, I need to be able to pass in the nushell config files so things operate as expected in my environment.
            
            First I&rsquo;ll setup a variable for the root directory where the config files live. While nushell currently defaults to the Apple-specifc XDG paths (like in `~/Library`), I don&rsquo;t like that. So I&rsquo;ll use the arch-based defaults.
            
            -   `org-babel-nushell-config-dir`
                
                ```emacs-lisp
                  (defvar org-babel-nushell-config-dir
                    (concat (file-name-as-directory (or (getenv "XDG_CONFIG_HOME")
                                                        (getenv "HOME" ".config")))
                            "nushell/")
                    "Absolute path to the root directory where config files for nushell exist.")
                ```
            
            Then I&rsquo;ll create two variables for the actual config files required for successful nushell startup.
            
            -   `org-babel-nushell-env-config-file`
                
                ```emacs-lisp
                  (defvar org-babel-nushell-env-config-file
                    (concat org-babel-nushell-config-dir "env.nu")
                    "Absolute path to the nu file used to configure a non-interactive nushell session.")
                ```
                
                ```emacs-lisp
                  org-babel-nushell-config-file
                ```
            
            -   `org-babel-nushell-config-file`
                
                ```emacs-lisp
                  (defvar org-babel-nushell-config-file
                    (concat org-babel-nushell-config-dir "config.nu")
                    "Absolute path to the nu file used to configure an interactive nushell session.")
                ```
                
                ```emacs-lisp
                  org-babel-nushell-env-config-file
                ```
            
            Lastly, I&rsquo;ll join them all together in a string with the `--login` flag.
            
            -   `org-babel-nushell-command-options`
                
                ```emacs-lisp
                  (defvar org-babel-nushell-command-options
                    (mapconcat 'identity (list "--no-newline"
                                              "--env-config"
                                              org-babel-nushell-env-config-file
                                              "--config"
                                              org-babel-nushell-config-file)
                              " ")
                    "The command options to use when executing code")
                ```
                
                Altogether, that should produce the following:
                
                ```emacs-lisp
                  org-babel-nushell-command-options
                ```
        
        3.  The execute function
        
            Everything before this was setting us up to be able to define a function that Org Babel will use to run a block of nushell code. That function must be named with a predictable format based on the language passed when defining src blocks.
            
            ```emacs-lisp
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
            ```
            
            The function above depends on some helpers to deal with variables passed into code blocks via the `:var` keyword. These are pretty straightforward string processing functions.
            
            ```emacs-lisp
            (defun org-babel-expand-body:nushell (body params &optional processed-params)
              "Expand BODY according to PARAMS, return the expanded body."
              (let* ((vars (org-babel--get-vars params)))
                (org-babel-nushell-custom-vars vars body)))
            ```
            
            1.  Creating variables
            
                1.  Concatenating with body
                
                    ```emacs-lisp
                    (defun org-babel-nushell-custom-vars (params body)
                      "Append custom variables at top."
                      (if (= (length params) 0)
                          body
                        (concat (mapconcat 'org-babel-nushell-var-to-nushell params "\n") "\n" body)))
                    ```
                    
                    ```emacs-lisp
                    (org-babel-nushell-custom-vars '(("one" . "a\n") ("two" . "b")) "my body")
                    ```
                
                2.  Parsing individual parameters
                
                    ```emacs-lisp
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
                    ```
                    
                    ```emacs-lisp
                    (org-babel-nushell-var-to-nushell '("my_var" . "my value"))
                    ```
            
            2.  Ensuring it works
            
                Here&rsquo;s a code block that we can run as a sanity check to make sure this is all working.
                
                ```nushell
                $str | split chars
                ```

5.  rose-doom-pine-emacs

    ```emacs-lisp
    (package! rose-pine-doom-emacs
      :recipe (:host github
               :repo "theutz/rose-pine-doom-emacs"
               :branch "main"))
    ```
    
    ```emacs-lisp
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
    ```

6.  gptel

    ```emacs-lisp
    (package! gptel)
    ```
    
    ```emacs-lisp
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
    ```

7.  chezmoi.el

    Chezmoi mode makes working with [chezmoi](https://www.chezmoi.io/) quite a bit easier by keeping the source and target in sync when you write.
    
    ```emacs-lisp
    (package! chezmoi)
    ```
    
    I&rsquo;ve setup a little sub-set of prefixes in the file-save keymap to work with some of it&rsquo;s commands.
    
    ```emacs-lisp
    (use-package! chezmoi
      :config
      (let ((base "fz"))
        (map! :leader :desc "chezmoi" :n base)
        (map! :leader :desc "Find in chezmoi" :n (concat base "f") #'chezmoi-find)
        (map! :leader :desc "Write to chezmoi" :n (concat base "s") #'chezmoi-write)
        (map! :leader :desc "Sync with chezmoi" :n (concat base "t") #'chezmoi-mode)
        (map! :leader :desc "Chezmoi git status" :n (concat base "o") #'chezmoi-open-other)))
    ```

8.  ox-gfm

    ```emacs-lisp
    (package! ox-gfm)
    ```
    
    ```emacs-lisp
    (use-package! ox-gfm :after org)
    ```

9.  grip-mode

    ```emacs-lisp
    (package! grip-mode)
    ```
    
    ```emacs-lisp
    (use-package! grip-mode
      ;; :hook ((markdown-mode org-mode) . grip-mode)
      :config
      (let ((credential (auth-source-user-and-password "api.github.com" "theutz")))
        (setq grip-github-user (car credential)
              grip-github-password (cadr credential)))
      (map! :mode org-mode :localleader :n "E" #'grip-browse-preview))
    ```

10. hydra

    ```emacs-lisp
    (package! hydra)
    ```
    
    ```emacs-lisp
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
      (map! :leader :prefix "w" :desc "resize windows" :n "SPC" #'doom-window-resize-hydra/body)))
    ```


<a id="org3106f99"></a>

## Modes


<a id="org6779fea"></a>

### Org

1.  Before loading

    Some variables need to be set before org loads.
    
    ```emacs-lisp
    (setq org-directory "~/Dropbox/org/")
    ```

2.  After loading

    But some can run after org loads. For instance, we can add some org modules.
    
    ```emacs-lisp
    (after! org
      (add-to-list 'org-modules 'org-habit))
    ```
    
    We can also change the org TODO keywords and their accompanying font styles
    
    ```emacs-lisp
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
    ```
    
    Or we can override some key maps that don&rsquo;t make much sense to us.
    
    ```emacs-lisp
    (after! org
      (map! :mode org-mode :n "gj" #'org-forward-element)
      (map! :mode org-mode :n "gk" #'org-backward-element)
      (map! :localleader :mode org-mode :desc "columns" :n "m")
      (map! :localleader :mode org-mode :desc "org-columns" :n "mm" #'org-columns)
      (map! :localleader :mode org-mode :desc "org-columns-quit" :n "mq" #'org-columns-quit)
      (map! :localleader :mode org-mode :desc "org-refile-copy" :n "rd" #'org-refile-copy)
      (map! :localleader :mode org-mode :desc "org-delete-property" :n "O" #'org-delete-property))
    ```
    
    And we can change the face attributes for org mode so that headlines are bigger.
    
    ```emacs-lisp
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
    ```


<a id="orgef629c9"></a>

### Nix

Use the [Alejandra](https://github.com/kamadorueda/alejandra) formatter.

```emacs-lisp
(after! nix-mode
  (set-formatter! 'alejandra '("alejandra" "--quiet") :modes '(nix-mode)))
```

For a lot of packages, we want to use the LSP to do the formatting. But not in this case.

```emacs-lisp
(setq-hook! 'nix-mode-hook +format-with-lsp nil)
```


<a id="orgd2c7873"></a>

### YAML

```emacs-lisp
(after! yaml-mode
  (set-formatter! 'prettierd '("/opt/homebrew/bin/prettierd") :modes '(yaml-mode)))
```


<a id="orgd688c82"></a>

## Bindings


<a id="org1818f7e"></a>

### Doom Overrides&#x2026;

1.  Workspaces

    ```emacs-lisp
    (map! :leader
          (:when (modulep! :ui workspaces)
            (:prefix-map ("TAB" . "workspace")
             :desc "Prev workspace" "p" #'+workspace/switch-left
             :desc "Next workspace" "n" #'+workspace/switch-right
             :desc "Create workspace" "c" #'+workspace/new
             :desc "Swap workspace left" "<" #'+workspace/swap-left
             :desc "Swap workspace right" ">" #'+workspace/swap-right)))
    ```


<a id="org94bbd19"></a>

### LazyVim compatibility layer

I&rsquo;ve got a lot of custom bindings that are meant to make switching between LazyVim and DoomEmacs less jarring.

-   Sometimes it&rsquo;s the simple things&#x2026; `e` for *explorer*.
    
    ```emacs-lisp
            (map! :leader :desc "Find file" :n "e" 'find-file)
    ```

-   Simple terminal stuff
    
    ```emacs-lisp
            (map! :desc "Open terminal" :nvi "C-/" '+vterm/toggle)
    ```
