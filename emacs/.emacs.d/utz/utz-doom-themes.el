;;; utz-doom-themes.el -- Doom Themes
;;
;;; Commentary:
;;
;; Doom goes the dynamite.
;;
;;; Code:

(require 'doom-themes)

(with-eval-after-load 'doom-themes
  (defvar doom-themes-treemacs-theme "doom-colors")

  (when (fboundp 'doom-themes-visual-bell-config)
    (doom-themes-visual-bell-config))
  (when (fboundp 'doom-themes-treemacs-config)
    (doom-themes-treemacs-config))
  (when (fboundp 'doom-themes-org-config)
    (doom-themes-org-config)))

(provide 'utz-doom-themes)

;;; utz-doom-themes.el ends here
