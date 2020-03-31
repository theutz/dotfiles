;;; utz-languages.el -- Language Configuration
;;
;;; Commentary:
;;
;; Behold, the tower of babble
;;
;;; Code:

(require 'typescript-mode)
(require 'tide)
(require 'company)
(require 'flycheck)
(require 'gitignore-mode)
(require 'markdown-mode)
(require 'org)
(require 'org-bullets)

;; Org
(add-hook 'org-mode-hook '(lambda ()
			    (org-bullets-mode 1)))

;; Markdown

(dolist (file '(("README\\.(md|mdown)\\'" . gfm-mode)
		("\\.md\\'" . markdown-mode)
		("\\.markdown\\'" . markdown-mode)))
  (add-to-list 'auto-mode-alist file))

;; bash / zsh

(dolist (file '(".zshrc"
		".zpreztorc"
		".zprofile"
		".zlogin"))
  (add-to-list 'auto-mode-alist
	       `(,(concat "\\" file "\\'") . sh-mode)))

;; TypeScript

(add-hook 'typescript-mode-hook 'tide-setup)
(add-hook 'typescript-mode-hook 'tide-hl-identifier-mode)
(add-hook 'before-save-hook 'tide-format-before-save)

(provide 'utz-languages)
;;; utz-languages.el ends here
