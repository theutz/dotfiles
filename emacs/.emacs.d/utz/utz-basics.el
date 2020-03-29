;;; utz-basics.el -- Basic Emacs Configuration
;;
;;; Commentary:
;;
;; Things that Customize can't deal with.
;;
;;; Code:

(require 'server)

;; Setup Server
(unless (server-running-p)
  (server-start))

(provide 'utz-basics)

;;; utz-basics.el ends here
