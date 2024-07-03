;;; lngs.el ---  -*- lexical-binding: t -*-
;;; Commentary:
;;; module to config "supported" programming languages
;;; Code:

(use-package eglot
  :config
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits nil))

(use-package rjsx-mode
  :ensure t
  :mode "\\.[mc]?js\\'"
  :mode "\\.es6\\'"
  :config
  (setq js-chain-indent t
        ;; These have become standard in the JS community
        js2-basic-offset 2
        ;; Don't mishighlight shebang lines
        js2-skip-preprocessor-directives t
        ;; let flycheck handle this
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        ;; Flycheck provides these features, so disable them: conflicting with
        ;; the eslint settings.
        js2-strict-missing-semi-warning nil
        ;; maximum fontification
        js2-highlight-level 3
        js2-idle-timer-delay 0.15)

)

(provide 'lngs)
;;; lngs.el ends here
