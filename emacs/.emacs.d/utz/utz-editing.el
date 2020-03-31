;;; utz-editing.el -- Editing Tools
;;
;;; Commentary:
;;
;; Sharpen the axe
;;
;;; Code:

(require 'flycheck)
(require 'ws-butler)
(require 'paredit)
(require 'company)
(require 'company-emoji)

(global-flycheck-mode)

(add-hook 'prog-mode-hook 'ws-butler-mode)
(add-hook 'org-mode-hook 'ws-butler-mode)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-emoji)

(provide 'utz-editing)
;;; utz-editing.el ends here
