;;;; org-init.el -- Get organized.

;;; Commentary:
;;
;; Does it bring you joy?
;;

;;; Code:

(require 'straight-init)

(use-package org
  :defines org-capture-templates
  :general
  (utz/set-leader-key/o "c" '(org-capture :wk "Capture"))
  (utz/set-leader-key/o-a "a" '(org-agenda :wk "Agenda"))
  (utz/set-leader-key/o-r
    "r" '(helm-org-rifle :wk "Open Buffers")
    "R" '(helm-org-rifle-occur :wk "Open Buffers (Occur)")
    "a" '(helm-org-rifle-agenda-files :wk "Agenda Files")
    "A" '(helm-org-rifle-occur-agenda-files :wk "Agenda Files (Occur)")
    "b" '(helm-org-rifle-current-buffer :wk "Current Buffer")
    "B" '(helm-org-rifle-occur-current-buffer :wk "Current Buffer (Occur)")
    "o" '(helm-org-rifle-org-directory :wk "Org Directory")
    "O" '(helm-org-rifle-occur-org-directory :wk "Org Directory (Occur)"))
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
