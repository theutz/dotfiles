;;;; org-init.el -- Get organized.

;;; Commentary:
;;
;; Does it bring you joy?
;;

;;; Code:

(require 'straight-init)

(use-package org
  :defines org-capture-templates
  :init
  (setq org-directory (expand-file-name "~/org")
	org-archive-location (expand-file-name "archive.org" org-directory)
	org-default-notes-file (expand-file-name "inbox.org" org-directory)
	org-capture-templates '(("t" "Todo" entry (file org-default-notes-file)
				 "* TODO %?\n\t%i\n\t%a")))
  :config
  (require 'org-inlinetask))

(use-package org-bullets
  :init
  (declare-function org-bullets-mode "org-bullets")
  :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package helm-org-rifle)

(provide 'org-init)

;;; org-init.el ends here
