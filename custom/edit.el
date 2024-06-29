;; -*- lexical-binding: t -*-

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package hydra
  :ensure t)

(use-package avy
  :ensure t)

(use-package which-key
  :ensure t
  :config   (which-key-mode))

(use-package helm
  :ensure t
  :config (helm-mode))

(use-package helm-xref
  :ensure t)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(use-package paredit
  :ensure t
  :hook (prog-mode . paredit-mode))

(use-package company
  :ensure t
  :config
  (setq	company-idle-delay 0.0
	company-minimum-prefix-length 1))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package apheleia
  :ensure t
  :hook (prog-mode . apheleia-mode))

(provide 'edit)
;; edit.el ends here
