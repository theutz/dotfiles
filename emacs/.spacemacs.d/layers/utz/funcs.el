(when (configuration-layer/package-usedp 'org)
  (defun utz/org-swap-tags (tags)
    "Replace any tags on the current headline with TAGS.

  The assumption is that TAGS will be a string conforming to Org Mode's
  tag format specifications, or nil to remove all tags."
    (let ((old-tags (org-get-tags-string))
          (tags (if tags
                    (concat " " tags)
                  "")))
      (save-excursion
        (beginning-of-line)
        (re-search-forward
        (concat "[ \t]*" (regexp-quote old-tags) "[ \t]*$")
        (line-end-position) t)
        (replace-match tags)
        (org-set-tags t))))

  (defun utz/org-set-tags (tag)
    "Add TAG if it is not in the list of tags, remove it otherwise.

  TAG is chosen interactively from the global tags completion table."
    (interactive
    (list (let ((org-last-tags-completion-table
                  (if (derived-mode-p 'org-mode)
                      (org-uniquify
                      (delq nil (append (org-get-buffer-tags)
                                        (org-global-tags-completion-table))))
                    (org-global-tags-completion-table))))
            (org-icompleting-read
              "Tag: " 'org-tags-completion-function nil nil nil
              'org-tags-history))))
    (let* ((cur-list (org-get-tags))
          (new-tags (mapconcat 'identity
                                (if (member tag cur-list)
                                    (delete tag cur-list)
                                  (append cur-list (list tag)))
                                ":"))
          (new (if (> (length new-tags) 1) (concat " :" new-tags ":")
                  nil)))
      (utz/org-swap-tags new))
  )
)

(defun utz/emerge--close-current-frame ()
  "close the current frame"
  (delete-frame (selected-frame)))

(defun utz/emerge (local remote baser output)
  (emerge-files-with-ancestor nil local remote base output nil 'utz/emerge--close-current-frame))

