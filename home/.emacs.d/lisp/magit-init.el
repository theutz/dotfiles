;;;; magit-init.el -- Invoke the magic of git

;;; Commentary:
;;
;; Do you believe in magit?
;;

;;; Code:

(require 'straight-init)

(use-package magit)

(use-package forge
  :after magit)

(use-package magit-todos
  :after magit
  :hook '(magit . magit-todos))

(provide 'magit-init)
;;; magit-init.el ends here
