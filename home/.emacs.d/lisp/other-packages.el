;;;; other-packages.el -- You know, the leftovers.

;;; Commentary:
;;
;; Doesn't mean they're not important.
;;

;;; Code:

(require 'straight-init)

(use-package sh-script
  :mode (("\\.zpreztorc\\'" . sh-mode)
	 ("\\zpreztorc\\'" . sh-mode)
	 ("\\.zprofile\\'" . sh-mode)
	 ("\\zprofile\\'" . sh-mode)
	 ("\\zshenv\\'" . sh-mode)
	 ("\\zshrc\\'" . sh-mode)))

(use-package yasnippet
  :init
  (declare-function yas-global-mode "yasnippet")
  :config
  (setq yas-snippet-dirs '(utz-snippets-directory)
	yas-verbosity 2)
  (yas-global-mode 1))

(use-package git-gutter
  :init
  (declare-function global-git-gutter-mode "git-gutter")
  :config
  (global-git-gutter-mode +1))

(use-package vterm
  :after evil
  :init
  (setq vterm-kill-buffer-on-exit t)
  :config
  (add-hook 'vterm-mode-hook (lambda ()
			       (setq-local evil-insert-state-cursor 'box)
			       (evil-insert-state))))

(use-package multi-vterm
  :after vterm)

(use-package flycheck
  :functions global-flycheck-mode
  :after (exec-path-from-shell)
  :config
  (global-flycheck-mode))

(use-package exec-path-from-shell
  :init
  (declare-function exec-path-from-shell-initialize "exec-path-from-shell")
  :config
  (exec-path-from-shell-initialize))

(use-package restart-emacs)

(use-package company
  :hook (after-init . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package which-key
  :demand t
  :init
  (declare-function which-key-setup-side-window-bottom "which-key")
  (declare-function which-key-mode "which-key")
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package web-mode
	:mode ("\\.html\\'"
				 "\\.jsx\\'"
				 "\\.tsx\\'"
				 "\\.json\\'")
	:init
	(setq web-mode-code-indent-offset 2
				web-mode-enable-auto-quoting nil))

(use-package typescript-mode)

(use-package tide
	:after (typescript-mode company flycheck)
	:hook ((typescript-mode . #'setup-tide-mode)
				 (web-mode . (lambda ()
												(when (string-equal "tsx" (file-name-extension buffer-file-name))
													(setup-tide-mode)))))
	:init
	(setq company-tooltip-align-annotations t))

(defun setup-tide-mode ()
	(interactive)
	(tide-setup)
	(flycheck-mode +1)
	(setq flycheck-check-syntax-automatically '(save mode-enabled))
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1))

(use-package prettier-js
  :hook (web-mode . prettier-js-mode))

(use-package all-the-icons)

(use-package helpful)

(use-package finder+)

(use-package doom-themes
  :functions (doom-themes-visual-bell-config
	     doom-themes-org-config
	     doom-themes-treemacs-config)
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-themes-treemacs-config))

(provide 'other-packages)

;;; other-packages.el ends here
