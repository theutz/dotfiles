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

;; [[file:config.org::*Package setup][Package setup:1]]
(package! nushell-mode
  :recipe (:host github
           :repo "mrkkrp/nushell-mode"))
;; Package setup:1 ends here

;; [[file:config.org::*rose-doom-pine-emacs][rose-doom-pine-emacs:1]]
(package! rose-pine-doom-emacs
  :recipe (:host github
           :repo "theutz/rose-pine-doom-emacs"
           :branch "main"))
;; rose-doom-pine-emacs:1 ends here

;; [[file:config.org::*gptel][gptel:1]]
(package! gptel)
;; gptel:1 ends here

;; [[file:config.org::*chezmoi.el][chezmoi.el:1]]
(package! chezmoi)
;; chezmoi.el:1 ends here

;; [[file:config.org::*ox-gfm][ox-gfm:1]]
(package! ox-gfm)
;; ox-gfm:1 ends here

;; [[file:config.org::*grip-mode][grip-mode:1]]
(package! grip-mode)
;; grip-mode:1 ends here

;; [[file:config.org::*hydra][hydra:1]]
(package! hydra)
;; hydra:1 ends here

;; [[file:config.org::*multi-vterm][multi-vterm:1]]
(package! multi-vterm)
;; multi-vterm:1 ends here

;; [[file:config.org::*php-ts-mode][php-ts-mode:1]]
(package! php-ts-mode
  :recipe (:host github
           :repo "emacs-php/php-ts-mode"
           :branch "master"))
;; php-ts-mode:1 ends here
