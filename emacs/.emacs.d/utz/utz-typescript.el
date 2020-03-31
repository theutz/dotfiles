;;; utz-typescript.el -- TypeScript Configuration
;;
;;; Commentary:
;;
;; Type all the things.
;;
;;; Code:

(require 'typescript-mode)

(with-eval-after-load 'typescript-mode
  (with-eval-after-load 'company
    (with-eval-after-load 'flycheck
      (require 'tide)
      (add-hook 'typescript-mode-hook 'tide-setup)
      (add-hook 'typescript-mode-hook 'tide-hl-identifier-mode)
      (add-hook 'before-save-hook 'tide-format-before-save))))

(provide 'utz-typescript)

;;; utz-typescript.el ends here
