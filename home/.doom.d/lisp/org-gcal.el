;;; ../.dotfiles/home/.doom.d/lisp/gcal.el -*- lexical-binding: t; -*-

(load! "dropbox")
(load! "util")

(setq! org-gcal-client-id
       (car (theutz/read-lines (expand-file-name "gcal_client_id" theutz-dropbox-emacs))))

(setq! org-gcal-client-secret
       (car (theutz/read-lines (expand-file-name "gcal_client_secret" theutz-dropbox-emacs))))

(setq! org-gcal-file-alist
       '(("michael.utz@smartly.io" . (expand-file-name "schedule.org" org-directory))))
