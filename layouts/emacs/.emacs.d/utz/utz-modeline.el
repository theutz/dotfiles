;;; utz-modeline.el -- Modeline Configuration
;;
;;; Commentary:
;;
;; Status Report:
;;
;;; Code:

(require 'diminish)
(require 'delight)
(require 'spaceline-config)
(require 'eldoc)

(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(spaceline-compile
  "utz"
  '(((persp-name
      workspace-number
      window-number)
     :fallback evil-state
     :face highlight-face
     :priority 100)
    (anzu :priority 95)
    auto-compile
    ((buffer-modified buffer-size buffer-id remote-host)
     :priority 98)
    (major-mode :priority 79)
    (process :when active)
    ((flycheck-error flycheck-warning flycheck-info)
     :when active
     :priority 89)
    (minor-modes :when active
		 :priority 9)
    (mu4e-alert-segment :when active)
    (erc-track :when active)
    (version-control :when active
		     :priority 78)
    (org-pomodoro :when active)
    (org-clock :when active)
    nyan-cat)
  '(which-function
    (python-pyvenv :fallback python-pyenv)
    (purpose :priority 94)
    (battery :when active)
    (selection-info :priority 95)
    input-method
    ((buffer-encoding-abbrev
      point-position
      line-column)
     :separator " | "
     :priority 96)
    (global :when active)
    (buffer-position :priority 99)
    (hud :priority 99)))

(setq-default mode-line-format '("%e" (:eval (spaceline-ml-utz))))

(diminish 'auto-revert-mode)
(delight 'helm-mode "☸")
(delight 'yas-minor-mode "✂")
(diminish 'undo-tree-mode)
(diminish 'paredit-mode)
(diminish 'ws-butler-mode)
(diminish 'evil-commentary-mode)
(diminish 'auto-revert-mode)
(diminish 'helm-mode)

(provide 'utz-modeline)
;;; utz-modeline.el ends here
