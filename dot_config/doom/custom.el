(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(safe-local-variable-values
   '((eval add-hook 'compilation-filter-hook
      (lambda nil
        (remove-overlays))
      nil t)
     (eval add-hook 'org-babel-tangle-finished-hook
      (lambda nil
        (org-gfm-export-to-markdown))
      nil t)
     (eval add-hook 'before-save-hook
      (lambda nil
        (save-excursion
          (org-babel-execute-buffer)))
      nil t)
     (eval add-hook 'before-save-hook
      (lambda nil
        (org-babel-execute-buffer)))
     (eval add-hook 'org-babel-tangle-finished-hook
      (lambda nil
        (org-gfm-export-to-markdown)))
     (eval add-hook 'after-save-hook
      (lambda nil
        (org-gfm-export-to-markdown))
      nil t)
     (eval add-hook 'after-save-hook
      (lambda nil
        (org-babel-tangle))
      nil t)
     (eval add-hook 'after-save-hook
      (lambda nil
        (org-gfm-export-to-markdown)))
     (eval add-hook 'after-save-hook
      (lambda nil
        (org-babel-tangle)))
     (eval add-hook 'after-save-hook
      (lambda
        (if
            (yes-or-no-p "Tangle?")
            (org-babel-tangle)))
      nil t)
     (eval add-hook 'after-save-hook
      (lambda nil
        (if
            (yes-or-no-p "Tangle?")
            (org-babel-tangle)))
      nil t)
     (eval add-hook! 'after-save-hook
      (lambda nil
        (if
            (yes-or-no-p "Tangle?")
            (org-babel-tangle)
          nil)))
     (eval add-hook! 'after-save-hook
      (if
          (yes-or-no-p "Tangle?")
          (org-babel-tangle)
        nil))
     (evil-shift-width . 2)
     (eval add-hook! 'after-save-hook #'org-babel-tangle)
     (eval add-hook 'after-save-hook
      (lambda nil
        (if
            (y-or-n-p "Tangle?")
            (org-babel-tangle)))
      nil t)
     (eval add-hook 'org-babel-post-tangle-hook #'chezmoi-write)
     (line-spacing . 0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
