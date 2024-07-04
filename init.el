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
   '("34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" default))
 '(org-agenda-files '("~/org/mylife.org"))
 '(package-selected-packages
   '(multi-vterm vterm add-node-modules-path exec-path-from-shell rjsx-mode prettier-js flycheck company paredit helm-xref helm which-key avy hydra yasnippet projectile winum doom-themes)))
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
(require 'orgm)
;; (require 'lsp-n-dap)
;; (require 'lng-lisp)
;; (require 'lng-web)
;; (require 'lng-syst)

(require 'lngs)

(provide 'init)
;;; init.el ends here
