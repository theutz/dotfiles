(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("587938eeeaefd2b2f68a0970e02985246a28c02c1c140cb0943d2b6909c47261" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" default))
 '(safe-local-variable-values
   '((eval add-to-list 'auto-mode-alist
           '("\\.skhdrc\\'" . conf-mode))
     (eval add-to-list 'auto-mode-alist
           ("\\.skhdrc\\'" . conf-mode))
     (eval let
           ((config-files-list
             '("\\.?zshenv\\'" "\\.?zprofile\\'" "\\.?zlogin\\'" "\\.?zlogout\\'" "\\.?zpreztorc\\'" "yabairc\\'")))
           (dolist
               (elt config-files-list nil)
             (add-to-list 'auto-mode-alist
                          `(,elt . sh-mode)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
