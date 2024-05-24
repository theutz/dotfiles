;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! just-mode)

(package! justl)

(package! kdl-mode
  :recipe (:host github
           :repo "bobuk/kdl-mode"
           :branch "main"))

(package! nushell-mode
  :recipe (
           :host github
           :repo "mrkkrp/nushell-mode"))

(package! autothemer)

(package! rose-pine-emacs
  :recipe (:host github
           :repo "thongpv87/rose-pine-emacs"
           :branch "master"))

(package! gptel)
