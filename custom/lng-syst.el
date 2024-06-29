;; -*- lexical-binding: t -*-

(use-package json-mode
  :ensure t)


(defun ig40in/setup-markdown-mode ()
  (visual-fill-column-mode 1)
  (display-line-numbers-mode 0))

(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (setq markdown-command "marked")
  (add-hook 'markdown-mode-hook #'ig40in/setup-markdown-mode)
  (dolist (face '((markdown-header-face-1 . 1.2)
                  (markdown-header-face-2 . 1.1)
                  (markdown-header-face-3 . 1.0)
                  (markdown-header-face-4 . 1.0)
                  (markdown-header-face-5 . 1.0)))
    (set-face-attribute (car face) nil :weight 'normal :height (cdr face))))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(provide 'lng-syst)
;; lng-syst.el ends here
