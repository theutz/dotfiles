;;; utz-hooks.el -- Custom Hooks
;;
;;; Commentary:
;;
;; Argh, matey.
;;
;;; Code:

(require 'utz-funcs)

(add-hook 'after-init-hook '(lambda () (utz/setup-emoji-font nil)))
(add-hook 'after-make-frame-functions #'utz/setup-emoji-font)

(provide 'utz-hooks)

;;; utz-hooks.el ends here
