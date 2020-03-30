;;; utz-evil.el -- Evil Configuration
;;
;;; Commentary:
;;
;; Evil setup
;;
;;; Code:

(require 'utz-straight)

(straight-use-package 'evil)
(straight-use-package 'evil-org)
(straight-use-package 'evil-surround)
(straight-use-package 'evil-collection)
(straight-use-package 'evil-commentary)
(straight-use-package 'evil-magit)

(require 'evil)

(setq evil-normal-state-tag "NORMAL"
      evil-visual-state-tag "VISUAL"
      evil-insert-state-tag "INSERT"
      evil-emacs-state-tag "EMACS"
      evil-replace-state-tag "REPLACE"
      evil-motion-state-tag "MOTION"
      evil-operator-state-tag "OPERATOR")

(with-eval-after-load 'evil
  (require 'evil-surround)
  (require 'evil-collection)
  (require 'evil-commentary)

  (evil-mode 1)

  (with-eval-after-load 'evil-surround
    (when (fboundp 'global-evil-surround-mode)
      (global-evil-surround-mode 1)))

  (with-eval-after-load 'evil-collection
    (when (fboundp 'evil-collection-init)
      (evil-collection-init)))

  (with-eval-after-load 'evil-commentary
    (when (fboundp 'evil-commentary-mode)
      (evil-commentary-mode)))

  (with-eval-after-load 'org
    (require 'evil-org)
    (add-hook 'org-mode-hook 'evil-org-mode)
    (add-hook 'evil-org-mode-hook '(lambda ()
				     (evil-org-set-key-theme)))
    (with-eval-after-load 'evil-org
      (require 'evil-org-agenda)
      (evil-org-agenda-set-keys)))

  (with-eval-after-load 'magit
    (require 'evil-magit)))

(provide 'utz-evil)

;;; utz-evil.el ends here
