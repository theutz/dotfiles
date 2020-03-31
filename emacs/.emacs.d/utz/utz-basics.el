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

;; Encoding

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (defvar default-buffer-file-coding-system 'utf-8))
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Setup Server

(unless (server-running-p)
  (server-start))

;; Unloading themes

(defadvice load-theme (before theme-dont-propagate activate)
  "Disable all active themes when loading a new theme."
  (mapc #'disable-theme custom-enabled-themes))

(provide 'utz-basics)
;;; utz-basics.el ends here
