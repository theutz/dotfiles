;;; lisp/gptel.el -*- lexical-binding: t; -*-

(use-package! gptel
  :config
  (setq gptel-model "gpt-4")
  (add-hook! 'gptel-post-stream-hook 'gptel-auto-scroll)
  (add-hook! 'gptel-post-response-functions 'gptel-end-of-response)
  (map! :leader
        :desc "Open GPT"
        :n "og"
        #'gptel)
  (map! :localleader
        :mode gptel-mode
        :desc "Send prompt"
        :n "RET"
        #'gptel-send)
  (map! :localleader
        :mode gptel-mode
        :desc "Open gpt menu"
        :n "SPC"
        #'gptel-menu))
