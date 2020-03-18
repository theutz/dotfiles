;;;; init.el --- Bootstrap my Literate Config
;;; Commentary:
;;
;; Use straight.el, use-package.el, and org-mode to load my
;; configuration files
;;
;;; Code:

;; Setup straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Setup use-package.el
(straight-use-package 'use-package)
(require 'use-package)
(setq straight-use-package-by-default t)

;; Setup org-mode
(use-package org)

;; Load literate config
(setq utz-emacs-directory user-emacs-directory
      utz-emacs-config-file (expand-file-name "emacs-config.org" utz-emacs-directory))
(org-babel-load-file utz-emacs-config-file)

;;; init.el ends here
