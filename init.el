;;; init.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; main Emacs' config file
;;; Code:

(add-to-list 'load-path '"~/.emacs.d/custom")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb" default))
 '(package-selected-packages
   '(zig-mode geiser-guile geiser json-mode web-mode prettier-js toml-mode rust-playground rustic helm-lsp lsp-treemacs lsp-mode company yasnippet flycheck helm-xref helm projectile which-key avy hydra wgrep paredit rainbow-delimiters winum magit multi-vterm vterm exec-path-from-shell nano-theme zenburn-theme doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'packages)
(require 'core)
(require 'utils)
(require 'edit)
(require 'lsp-n-dap)
(require 'rust)
;; (require 'sm-parens)
(require 'orgm)
(require 'org-gtd)
(require 'prog)

(provide 'init)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
