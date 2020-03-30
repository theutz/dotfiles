;;; utz-advice.el -- Custom Advice
;;
;;; Commentary:
;;
;; You can talk to me, son.
;;
;;; Code:

(defadvice load-theme (before theme-dont-propagate activate)
  "Disable all active themes when loading a new theme."
  (mapcar #'disable-theme custom-enabled-themes))

(provide 'utz-advice)

;;; utz-advice.el ends here
