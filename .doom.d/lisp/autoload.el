;;;###autoload
(defun theutz/doom-what-changed ()
  "Compare the init.el that's in use with what's available in the newest version of doom."
  (interactive)
  (let ((old-file (expand-file-name "init.el" doom-private-dir))
        (new-file (expand-file-name "init.example.el" user-emacs-directory)))
    (ediff old-file new-file)))

;;;###autoload
(defun theutz/open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    ;; (cfw:org-create-source "Green")  ; org-agenda source
    ;; (cfw:org-create-file-source "cal" "/path/to/cal.org" "Cyan")  ; other org source
    ;; (cfw:howm-create-source "Blue")  ; howm source
    ;; (cfw:cal-create-source "Orange") ; diary source
    ;; (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    (cfw:ical-create-source "Smartly" "https://calendar.google.com/calendar/ical/michael.utz%40smartly.io/private-ebc1bdad8071c23914f4411d2f515d50/basic.ics" "Green")
   )))
