;;; utz-customize.el -- Utz Customization Group
;;
;;; Commentary:
;;
;; All together now...
;;
;;; Code:

(defcustom utz-configuration-file
  (expand-file-name "init.el" user-emacs-directory)
  "The main init file for configuration."
  :group 'utz
  :type 'file)

(defcustom utz-packages-directory
  (expand-file-name "straight/repos/" user-emacs-directory)
  "The directory for straight.el repositories."
  :group 'utz
  :type 'directory)

(defgroup utz nil "Utz Customization Settings"
  :group 'local)

(provide 'utz-customize)
;;; utz-customize.el ends here
