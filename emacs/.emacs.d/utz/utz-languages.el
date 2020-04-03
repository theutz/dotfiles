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
(require 'f)
(require 's)
(require 'dash)
(require 'helm-org-rifle)
(require 'js2-mode)
(require 'web-mode)

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

;; Web Mode
(dolist (file '(".html"
		".jsx"
		".tsx"))
  (let ((file-spec (concat "\\" file "\\'")))
    (add-to-list 'auto-mode-alist `(,file-spec . web-mode))))

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; TypeScript

(defun setup-tide-mode ()
  "Setup 'tide-mode' for TypeScript."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (eldoc-mode +1)
  (company-mode +1))

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook 'tide-hl-identifier-mode)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'js2-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook '(lambda ()
			    (let ((ext (file-name-extension buffer-file-name)))
			      (when (or (string-equal "tsx" ext) (string-equal "jsx" ext))
				(setup-tide-mode)))))

(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

(provide 'utz-languages)
;;; utz-languages.el ends here
