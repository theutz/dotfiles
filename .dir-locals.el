;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil
  . ((eval
          . (let ((config-files-list
                   '("\\.?zshenv\\'"
                     "\\.?zprofile\\'"
                     "\\.?zlogin\\'"
                     "\\.?zlogout\\'"
                     "\\.?zpreztorc\\'"
                     "yabairc\\'")))
              (dolist (elt config-files-list nil)
                (add-to-list 'auto-mode-alist `(,elt . sh-mode)))))))
 (nil
  . ((eval
      . (add-to-list 'auto-mode-alist ("\\.skhdrc\\'" . conf-mode))))))
