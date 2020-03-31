;;; utz-which-key.el -- Which Key Configuration
;;
;;; Commentary:
;;
;; Which key?
;;
;;; Code:

(require 'which-key)
(require 'diminish)

(with-eval-after-load 'which-key
  (which-key-mode)
  (which-key-setup-side-window-bottom)

  (with-eval-after-load 'diminish
    (diminish 'which-key-mode)))

(provide 'utz-which-key)

;;; utz-which-key.el ends here
