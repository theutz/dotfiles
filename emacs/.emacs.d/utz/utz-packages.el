;;; packages.el -- Setup straight.el
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

(require 'straight)

(dolist (pkg '(
	       evil
	       evil-org
	       evil-surround
	       evil-collection
	       evil-commentary
	       evil-magit
	       general
	       ranger
	       company
	       delight
	       company-emoji
	       diminish
	       doom-themes
	       flycheck
	       gitignore-mode
	       helm
	       helm-ag
	       helm-descbinds
	       helm-org-rifle
	       f
	       s
	       dash
	       helpful
	       magit
	       markdown-mode
	       org
	       org-bullets
	       paredit
	       restart-emacs
	       spaceline
	       typescript-mode
	       tide
	       unicode-fonts
	       which-key
	       ws-butler
	       rainbow-mode
	       yasnippet
	       projectile
	       helm-projectile
	       persp-mode
	       persp-mode-projectile-bridge
	       hydra
	       figlet
	       ))
  (straight-use-package pkg))

(provide 'utz-packages)
;;; utz-packages.el ends here
