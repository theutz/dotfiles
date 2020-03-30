;;; utz-helpful.el -- Helpful Configuration
;;
;;; Commentary:
;;
;; Be more helpful.
;;
;;; Code:

(require 'utz-straight)
(require 'utz-general)

(straight-use-package 'helpful)
(require 'helpful)

(general-define-key
 :states 'normal
 :keymaps 'helpful-mode-map
 "q" '(evil-window-delete :wk "Delete Window"))

(provide 'utz-helpful)

;;; utz-helpful.el ends here
