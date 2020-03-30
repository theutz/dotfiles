;;; utz-basics.el -- Basic Emacs Configuration
;;
;;; Commentary:
;;
;; Things that Customize can't deal with.
;;
;;; Code:

(require 'server)

;; Environment Variables
(setenv "PATH"
	(concat
	 (getenv "PATH")
	 ":/usr/local/bin"))

;; Setup Server
(unless (server-running-p)
  (server-start))

;; Setup Utz Customization Grorup
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

(provide 'utz-basics)

;;; utz-basics.el ends here
