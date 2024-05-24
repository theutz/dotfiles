;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; [[file:config.org::*just-mode][just-mode:1]]
(package! just-mode)
;; just-mode:1 ends here

;; [[file:config.org::*justl][justl:1]]
(package! justl)
;; justl:1 ends here

;; [[file:config.org::*kdl-mode][kdl-mode:1]]
(package! kdl-mode
  :recipe (:host github
           :repo "bobuk/kdl-mode"
           :branch "main"))
;; kdl-mode:1 ends here

;; [[file:config.org::*nushell-mode][nushell-mode:1]]
(package! nushell-mode
  :recipe (
           :host github
           :repo "mrkkrp/nushell-mode"))
;; nushell-mode:1 ends here

;; [[file:config.org::*gptel][gptel:1]]
(package! gptel)
;; gptel:1 ends here

;; [[file:config.org::*chezmoi.el][chezmoi.el:1]]
(package! chezmoi)
;; chezmoi.el:1 ends here
