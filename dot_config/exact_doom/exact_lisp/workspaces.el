;;; lisp/workspaces.el -*- lexical-binding: t; -*-

(map! :leader
      (:when (modulep! :ui workspaces)
        (:prefix-map ("TAB" . "workspace")
         :desc "Prev workspace" "p" #'+workspace/switch-left
         :desc "Next workspace" "n" #'+workspace/switch-right
         :desc "Create workspace" "c" #'+workspace/new
         :desc "Swap workspace left" "<" #'+workspace/swap-left
         :desc "Swap workspace right" ">" #'+workspace/swap-right)))
