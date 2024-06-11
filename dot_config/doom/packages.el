;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; just-mode

;; This package provides a basic minor mode for interacting with a =Justfile=.


;; [[file:config.org::*just-mode][just-mode:1]]
(package! just-mode)
;; just-mode:1 ends here

;; justl

;; This package creates a listing of public Just commands and lets you execute them in a compilation buffer.


;; [[file:config.org::*justl][justl:1]]
(package! justl)
;; justl:1 ends here

;; kdl-mode

;; KDL is a configuration language favored by some (mostly Rust-based) programs like [[https://zellij.dev/][Zellij]]. This provides basic syntax highlighting for it.


;; [[file:config.org::*kdl-mode][kdl-mode:1]]
(package! kdl-mode
  :recipe (:host github
           :repo "bobuk/kdl-mode"
           :branch "main"))
;; kdl-mode:1 ends here

;; Package setup

;; This little package provides some syntax highlighting.


;; [[file:config.org::*Package setup][Package setup:1]]
(package! nushell-mode
  :recipe (:host github
           :repo "mrkkrp/nushell-mode"))
;; Package setup:1 ends here

;; rose-doom-pine-emacs


;; [[file:config.org::*rose-doom-pine-emacs][rose-doom-pine-emacs:1]]
(package! rose-pine-doom-emacs
  :recipe (:host github
           :repo "theutz/rose-pine-doom-emacs"
           :branch "main"))
;; rose-doom-pine-emacs:1 ends here

;; gptel


;; [[file:config.org::*gptel][gptel:1]]
(package! gptel)
;; gptel:1 ends here

;; chezmoi.el

;; Chezmoi mode makes working with [[https://www.chezmoi.io/][chezmoi]] quite a bit easier by keeping the source and target in sync when you write.


;; [[file:config.org::*chezmoi.el][chezmoi.el:1]]
(package! chezmoi)
;; chezmoi.el:1 ends here

;; ox-gfm


;; [[file:config.org::*ox-gfm][ox-gfm:1]]
(package! ox-gfm)
;; ox-gfm:1 ends here

;; grip-mode


;; [[file:config.org::*grip-mode][grip-mode:1]]
(package! grip-mode)
;; grip-mode:1 ends here

;; hydra


;; [[file:config.org::*hydra][hydra:1]]
(package! hydra)
;; hydra:1 ends here

;; multi-vterm


;; [[file:config.org::*multi-vterm][multi-vterm:1]]
(package! multi-vterm)
;; multi-vterm:1 ends here

;; php-ts-mode


;; [[file:config.org::*php-ts-mode][php-ts-mode:1]]
(package! php-ts-mode
  :recipe (:host github
           :repo "emacs-php/php-ts-mode"
           :branch "master"))
;; php-ts-mode:1 ends here
