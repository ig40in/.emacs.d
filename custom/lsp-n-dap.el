;; -*- lexical-binding: t -*-

(use-package dap-mode
  :ensure t)
;; M-x dap-firefox-setup required

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-warn-no-matched-clients nil)
  :hook
  (prog-mode . #'lsp))
(with-eval-after-load 'lsp-mode
  (require 'dap-firefox)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package lsp-treemacs
  :ensure t)

(use-package helm-lsp
  :ensure t)

(provide 'lsp-n-dap)
;; lsp-n-dap.el ends here
