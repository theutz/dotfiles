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

(defcustom utz-leader-key
  "SPC"
  "The prefix key to use for keybindings."
  :group 'utz
  :type 'string)

(defcustom utz-localleader-key
  ","
  "The prefix key to use for 'major-mode' keybindings."
  :group 'utz
  :type 'string)

(defgroup utz nil "Utz Customization Settings"
  :group 'local)

(provide 'utz-customize)
;;; utz-customize.el ends here
