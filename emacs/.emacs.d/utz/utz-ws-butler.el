;;; utz-ws-butler.el -- Whitespace Butler Config
;;
;;; Commentary:
;;
;; Jeeves.
;;
;;; Code:

(require 'utz-straight)
(straight-use-package 'ws-butler)
(require 'ws-butler)

(with-eval-after-load 'ws-butler
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'org-mode-hook 'ws-butler-mode))

(provide 'utz-ws-butler)

;;; utz-ws-butler.el ends here
