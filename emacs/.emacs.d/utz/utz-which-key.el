;;; utz-which-key.el -- Which Key Configuration
;;
;;; Commentary:
;;
;; Which key?
;;
;;; Code:

(require 'utz-straight)
(straight-use-package 'which-key)

(require 'which-key)
(require 'utz-diminish)

(with-eval-after-load 'which-key
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (with-eval-after-load 'diminish
    (diminish 'which-key-mode)))

(provide 'utz-which-key)

;;; utz-which-key.el ends here
