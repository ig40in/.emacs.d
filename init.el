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
)
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
