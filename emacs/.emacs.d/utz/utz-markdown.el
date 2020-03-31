;;; utz-markdown.el -- Markdown Configuration
;;
;;; Commentary:
;;
;; Mark this.
;;
;;; Code:

(require 'markdown-mode)

(with-eval-after-load 'markdown-mode
  (dolist (mode-assoc '(("README\\.(md|mdown)\\'" . gfm-mode)
			("\\.md\\'" . markdown-mode)
			("\\.markdown\\'" . markdown-mode)))
    (add-to-list 'auto-mode-alist mode-assoc)))

(provide 'utz-markdown)

;;; utz-markdown.el ends here
