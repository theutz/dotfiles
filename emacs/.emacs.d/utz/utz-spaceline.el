;;; utz-spaceline.el -- Spaceline Configuration
;;
;;; Commentary:
;;
;; Welcome to outer space.
;;
;;; Code:

(require 'utz-straight)
(straight-use-package 'spaceline)
(require 'spaceline)
(require 'spaceline-config)

(with-eval-after-load 'spaceline
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

  (dolist (func '(spaceline-spacemacs-theme
		  spaceline-helm-mode
		  spaceline-info-mode
		  spaceline-toggle-buffer-size-off))
    (when (fboundp func)
      (funcall func))))

(provide 'utz-spaceline)

;;; utz-spaceline.el ends here
