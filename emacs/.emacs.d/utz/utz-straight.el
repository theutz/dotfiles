;;; utz-straight.el -- Setup straight.el
;;
;;; Commentary:
;;
;; From GitHub, basically.
;;
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'evil)
(straight-use-package 'evil-org)
(straight-use-package 'evil-surround)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-magit)
(straight-use-package 'general)
(straight-use-package 'ranger)
(straight-use-package 'company)
(straight-use-package 'delight)
(straight-use-package 'company-emoji)
(straight-use-package 'diminish)
(straight-use-package 'doom-themes)
(straight-use-package 'flycheck)
(straight-use-package 'gitignore-mode)
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(straight-use-package 'helm-descbinds)
(straight-use-package 'helpful)
(straight-use-package 'magit)
(straight-use-package 'markdown-mode)
(straight-use-package 'org)
(straight-use-package 'org-bullets)
(straight-use-package 'paredit)
(straight-use-package 'restart-emacs)
(straight-use-package 'spaceline)
(straight-use-package 'typescript-mode)
(straight-use-package 'tide)
(straight-use-package 'unicode-fonts)
(straight-use-package 'which-key)
(straight-use-package 'ws-butler)

(provide 'utz-straight)

;;; utz-straight.el ends here
