;;; utz-sh-mode.el -- sh Mode
;;
;;; Commentary:
;;
;; Get out of your shell
;;
;;; Code:

(dolist (file '(".zshrc" ".zpreztorc" ".zprofile" ".zlogin"))
  (add-to-list 'auto-mode-alist `(,(concat "\\" file "\\'") . sh-mode)))

(provide 'utz-sh-mode)

;;; utz-sh-mode.el ends here
