;;; utz-which-key.el -- Which Key Configuration
;;
;;; Commentary:
;;
;; Which key?
;;
;;; Code:

(require 'utz-straight)
(require 'utz-diminish)

(straight-use-package 'which-key)
(require 'which-key)

(which-key-mode)
(which-key-setup-side-window-bottom)

(diminish 'which-key-mode)

(provide 'utz-which-key)

;;; utz-which-key.el ends here
