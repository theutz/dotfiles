;;; core-utz.el -- Utz Emacs Configuration
;;
;; Commentary:
;;
;; Initialize my configuration.
;;
;;; Code:

(require 'core-straight)
(require 'core-use-package)

(defun utz//init ()
  (utz//setup-straight)
  (utz//setup-use-package))

(provide 'core-utz)

;;; core-utz.el ends here.
