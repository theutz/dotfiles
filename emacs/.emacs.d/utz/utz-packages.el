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
	       bm
	       company
	       company-emoji
	       dash
	       delight
	       diminish
	       doom-themes
	       emojify
	       evil
	       evil-collection
	       evil-commentary
	       evil-magit
	       evil-org
	       evil-surround
	       f
	       figlet
	       flycheck
	       general
	       gitignore-mode
	       helm
	       helm-ag
	       helm-descbinds
	       helm-org-rifle
	       helm-projectile
	       helpful
	       hydra
	       js2-mode
	       magit
	       markdown-mode
	       org
	       org-bullets
	       paredit
	       persp-mode
	       persp-mode-projectile-bridge
	       projectile
	       rainbow-mode
	       ranger
	       restart-emacs
	       s
	       spaceline
	       tide
	       typescript-mode
	       unicode-fonts
	       web-mode
	       which-key
	       ws-butler
	       yasnippet
	       ))
  (straight-use-package pkg))

(provide 'utz-packages)
;;; utz-packages.el ends here
