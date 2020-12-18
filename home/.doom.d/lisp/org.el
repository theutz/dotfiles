(load! "org-gcal")
(load! "dropbox")

;;
;; org-journal files
;;
(add-to-list 'auto-mode-alist '("journal/[0-9]\\\{8\\\}\\'" . org-journal-mode))
(setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'"
      org-agenda-files `(,(expand-file-name org-directory) ,(expand-file-name org-journal-dir org-directory)))

;;
;; org-modules
;;
(add-to-list 'org-modules 'org-habit)

;;
;; org tags
;;
(setq org-tags-persistent-alist '((:startgroup . nil)
                                  ("@work" . ?w) ("@personal" . ?p)
                                  (:endgroup . nil)
                                  ("MacBook" . ?m) ("iPhone" . ?i)))

;;
;; org-capture
;;
(setq +org-capture-todo-file (expand-file-name "todo.org" org-directory))
(setq org-capture-templates
      '(("t" "Personal todo" entry
         (file +org-capture-todo-file)
         "* TODO %?\n%i\n%a")
        ("n" "Personal notes" entry
         (file+headline +org-capture-notes-file "Inbox")
         "* %u %?\n%i\n%a" :prepend t)
        ("j" "Journal" entry
         (file+olp+datetree +org-capture-journal-file)
         "* %U %?\n%i\n%a" :prepend t)
        ("p" "Templates for projects")
        ("pt" "Project-local todo" entry
         (file+headline +org-capture-project-todo-file "Inbox")
         "* TODO %?\n%i\n%a" :prepend t)
        ("pn" "Project-local notes" entry
         (file+headline +org-capture-project-notes-file "Inbox")
         "* %U %?\n%i\n%a" :prepend t)
        ("pc" "Project-local changelog" entry
         (file+headline +org-capture-project-changelog-file "Unreleased")
         "* %U %?\n%i\n%a" :prepend t)
        ("o" "Centralized templates for projects")
        ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
        ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
        ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)))

;;
;; deft
;;
(setq deft-directory (expand-file-name "notes" theutz-dropbox))
