;;; prog.el --- programming support -*- lexical-binding: t -*-
;;; Commentary:
;; module to config "supported" programming languages and
;; related stuff, i.e. "make programming work"
;;; Code:

;;; === LSP ===
(use-package eglot
  :config
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits nil))

;;; === Checkers & Formatters ===
(use-package flycheck
  :ensure t
  :config
  (add-to-list 'flycheck-checkers 'javascript-eslint)
  (global-flycheck-mode))

;; (use-package apheleia
;;   :ensure t
;;   :config
;;   (setf (alist-get 'prettier-javascript apheleia-formatters)
;;         `(,(alist-get 'prettier-javascript apheleia-formatters)
;;           "-semi" "true"
;;           "--single-quote" "true"
;;           "--jsx-single-quote" "true"
;;           "--trailing-coma" "none"
;;           "--no-bracket-spasing" "false"
;;           ))
;;   :hook (prog-mode . apheleia-mode))

;;; === Javascript ===

;; Adds node_modules/.bin directory to `exec_path'
;; This allows Emacs to find project based installs of e.g. eslint.
(use-package add-node-modules-path
  :hook ((web-mode js-mode js2-mode) . add-node-modules-path))

;; js-cmnty == "Javascript Comunity"
(defun js-cmnty/use-eslint-from-node-modules ()
    "Set local eslint if available."
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook 'js-cmnty/use-eslint-from-node-modules)

(use-package js-mode
  :ensure nil
  :mode "\\.[mc]?js[x]?\\'"
  ;; :hook
  ;; (js-mode . lsp-deferred)
  ;; (js-mode . dtrt-indent-mode)
  ;; (after-save . daut/js-standard-fix-file)
  :config
  (setq js-indent-level 2))

;; (use-package rjsx-mode
;;   :ensure t
;;   :mode "\\.[mc]?js[x]?\\'"
;;   :mode "\\.es6\\'"
;;   :config
;;   (setq js-chain-indent t
;;         ;; These have become standard in the JS community
;;         js2-basic-offset 2
;;         ;; Don't mishighlight shebang lines
;;         js2-skip-preprocessor-directives t
;;         ;; let flycheck handle this
;;         js2-mode-show-parse-errors nil
;;         js2-mode-show-strict-warnings nil
;;         ;; Flycheck provides these features, so disable them: conflicting with
;;         ;; the eslint settings.
;;         js2-strict-missing-semi-warning nil
;;         js2-space-before-function-paren nil
;;         ;; maximum fontification
;;         js2-highlight-level 3
;;         js2-idle-timer-delay 0.15)

;;   )

(use-package prettier-js
  :ensure t
  :config
  (setq prettier-js-args
        '("--no-semi"
          "--single-quote"
          "--jsx-single-quote"
          ;; "--trailing-comma" "es5"
          "--trailing-comma" "none"
          ;; "--no-bracket-spasing"

          ))
  :hook
  (js-mode . prettier-js-mode)
  (web-mode . prettier-js-mode))

;;; === Web: HTML & CSS ===
(use-package web-mode
  :ensure t
  ;; :hook
  ;; (web-mode . lsp-deferred)
  ;; (web-mode . web-mode-add-electric-pairs)
  ;; (web-mode . dtrt-indent-mode)
  :mode "\\.[px]?html?\\'"
  :mode "\\.\\(?:tpl\\|blade\\)\\(?:\\.php\\)?\\'"
  :mode "\\.erb\\'"
  :mode "\\.[lh]?eex\\'"
  :mode "\\.jsp\\'"
  :mode "\\.as[cp]x\\'"
  :mode "\\.ejs\\'"
  :mode "\\.hbs\\'"
  :mode "\\.mustache\\'"
  :mode "\\.svelte\\'"
  :mode "\\.twig\\'"
  :mode "\\.jinja2?\\'"
  :mode "\\.eco\\'"
  :mode "wp-content/themes/.+/.+\\.php\\'"
  :mode "templates/.+\\.php\\'"
  :mode "\\.vue\\'"
  :mode "\\.tmpl\\'"
  :mode "\\.gotmpl\\'"
  :mode "\\.gohtml\\'"
  :mode "\\.astro\\'"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 0)
  (setq web-mode-style-padding 0)
  (setq web-mode-engines-alist
        '(("go" . "\\.tmpl\\'"))))

;; CSS mode
(use-package css-mode
  :ensure t
  ;; :hook (css-mode . lsp-deferred)
  :init (setq css-indent-offset 2))

;;; === JSON ===
(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  ;; :hook
  ;; (json-mode . lsp-deferred)
  :config
  (setq js-indent-level 2))




;;; === Shemee/Guile ===
;;; Credit: https://github.com/daviwil/dotfiles/blob/master/.emacs.d/modules/dw-dev.el
;; Include .sld library definition files
(use-package scheme-mode
  :ensure nil
  :mode "\\.sld\\'")

(use-package geiser
  :ensure t
  :config
  ;; (setq geiser-default-implementation 'gambit)
  ;; (setq geiser-active-implementations '(gambit guile))
  ;; (setq geiser-implementations-alist '(((regexp "\\.scm$") gambit)
  ;;                                      ((regexp "\\.sld") gambit)))
  ;; (setq geiser-repl-default-port 44555) ; For Gambit Scheme
  (setq geiser-default-implementation 'guile)
  (setq geiser-active-implementations '(guile))
  (setq geiser-implementations-alist '(((regexp "\\.scm$") guile))))

(use-package geiser-guile
  :ensure t
  :after geiser
  ;; :config
  ;; (when (eq dw/current-distro 'void)
  ;;   (setq geiser-guile-binary "guile3")))
  )

(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
        '((astro "https://github.com/virchau13/tree-sitter-astro")
          (bash "https://github.com/tree-sitter/tree-sitter-bash")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (elisp "https://github.com/Wilfred/tree-sitter-elisp")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (vue "https://github.com/ikatyang/tree-sitter-vue")))
  (setq treesit-font-lock-level 4))


(provide 'prog)
;;; prog.el ends here
