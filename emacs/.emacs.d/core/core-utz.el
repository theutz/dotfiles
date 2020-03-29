;;; core-utz.el -- Utz Emacs Configuration
;;
;; Commentary:
;;
;; Initialize my configuration.
;;
;;; Code:

(require 'core-straight)
(require 'core-use-package)
(require 'core-funcs)

(defun utz//init ()
  ;; Load configuration variables
  (load utz-config-file nil (not init-file-debug))
  (setq custom-file utz-custom-file)
  (load utz-custom-file nil (not init-file-debug))

  ;; Setup package manager
  (utz//setup-straight)
  (utz//setup-use-package))

(provide 'core-utz)

;;; core-utz.el ends here.
