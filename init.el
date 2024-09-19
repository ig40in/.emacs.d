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
   '("de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0"
     "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02"
     default))
 '(package-selected-packages
   '(avy cargo-mode company doom-themes evil-surround
         exec-path-from-shell flycheck-eglot flycheck-rust
         geiser-guile helm-xref hydra json-mode lsp-ui magit
         multi-vterm nano-theme paredit prettier-js projectile
         rainbow-delimiters rainbow-mode rust-playground rustic
         toml-mode tree-sitter-langs vertico web-mode wgrep winum
         yasnippet zenburn-theme zig-mode)))
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
;; (require 'sm-parens)
(require 'orgm)
(require 'org-gtd)
(require 'prog)

(provide 'init)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
