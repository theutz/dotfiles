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

;; [[file:config.org::*autothemer][autothemer:1]]
(package! autothemer)
;; autothemer:1 ends here

;; [[file:config.org::*rose-pine-emacs][rose-pine-emacs:1]]
(package! rose-pine-emacs
  :recipe (:host github
           :repo "thongpv87/rose-pine-emacs"
           :branch "master"))
;; rose-pine-emacs:1 ends here

;; [[file:config.org::*gptel][gptel:1]]
(package! gptel)
;; gptel:1 ends here
