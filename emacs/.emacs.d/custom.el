;;; custom.el -- Options set by customize
;;
;;; Commentary:
;;
;; I am not a robot.
;;
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups/"))))
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 2)
 '(company-tooltip-limit 20)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (doom-wilmersdorf)))
 '(custom-safe-themes t)
 '(custom-theme-directory "~/.emacs.d/utz/themes")
 '(display-line-numbers (quote visual))
 '(display-line-numbers-current-absolute t)
 '(display-line-numbers-widen t)
 '(display-line-numbers-width 2)
 '(doom-themes-enable-bold t)
 '(doom-themes-padded-modeline t)
 '(evil-collection-company-use-tng nil)
 '(evil-echo-state nil)
 '(evil-shift-width 2)
 '(evil-split-window-below t)
 '(evil-vsplit-window-right t)
 '(evil-want-C-u-scroll t)
 '(evil-want-keybinding nil)
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs-plus/26.3/libexec/emacs/26.3/x86_64-apple-darwin19.3.0" "/usr/local/bin")))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(org-M-RET-may-split-line nil)
 '(org-agenda-files (quote ("~/Dropbox/org")))
 '(org-directory "~/Dropbox/org")
 '(ranger-override-dired (quote ranger))
 '(ranger-override-dired-mode t)
 '(ranger-show-hidden t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t)
 '(visible-bell t)
 '(which-key-sort-order (quote which-key-key-order-alpha)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282b33" :foreground "#c6c6c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Roboto Mono")))))

;;; custom.el ends here
