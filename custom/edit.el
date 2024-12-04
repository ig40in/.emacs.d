;;; edit.el --- "general" editing enchacements -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t)

(use-package flyspell
  :ensure t
  :when (or (executable-find "ispell")
            (executable-find "aspell")
            (executable-find "hunspell"))
  :hook ((org-mode git-commit-mode markdown-mode) . flyspell-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package rainbow-mode
;;   ;; :ensure t
;;   :hook (org-mode prog-mode))

(use-package paredit
  :ensure t
  :hook (prog-mode . paredit-mode))

(use-package wgrep
  :ensure t
  :hook (grep-mode . wgrep-setup))

;; (use-package yasnippet
;;   :ensure t
;;   :config (yas-global-mode))

(use-package hydra
  :ensure t)

(use-package avy
  :ensure t)

(use-package which-key
  :ensure t
  :config   (which-key-mode))

(use-package projectile
  :ensure t)

(use-package helm
  :ensure t
  :config (helm-mode))

(use-package helm-xref
  :ensure t)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (use-package company
;;   :ensure t
;;   :hook (prog-mode . company-mode)
;;   ;; :hook (prog-mode . company-tng-mode)
;;   :config
;;   (setq	company-idle-delay 0.0
;; 	      company-minimum-prefix-length 1)
;;   (setq eglot-ignored-server-capabilities '(:inlayHintProvider)))

;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; inline errors

(use-package flycheck :ensure)


;; -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
;; auto-completion and code snippets

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(use-package company
  :ensure
  :config
  (setq	company-idle-delay 0.2
	      company-minimum-prefix-length 1)
  :bind
  (:map company-active-map
              ("C-n". company-select-next)
              ("C-p". company-select-previous)
              ("M-<". company-select-first)
              ("M->". company-select-last))
  (:map company-mode-map
        ("<tab>". tab-indent-or-complete)
        ("TAB". tab-indent-or-complete)))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))


;; (use-package project
;;   :ensure t
;;   :config
;;   (add-to-list 'project-switch-commands '(magit-project-status "Magit" ?m)))


;; ;; VERTical Interactive COmpletion
;; (use-package vertico
;;   :ensure t
;;   :init
;;   (vertico-mode 1)
;;   :config
;;   (setq vertico-count 25))


;; ;; Save minibuffer history
;; (use-package savehist
;;   :ensure nil
;;   :init
;;   (savehist-mode 1))


;; ;; Enrich existing commands with completion annotations
;; (use-package marginalia
;;   :ensure t
;;   :init 
;;   (marginalia-mode 1))

;; ;; Modular text completion framework
;; (use-package corfu
;;   :ensure t
;;   :init
;;   (global-corfu-mode 1)
;;   (corfu-popupinfo-mode 1)
;;   :config
;;   (setq corfu-cycle t
;;         corfu-auto t
;;         corfu-auto-delay 0.1
;;         corfu-auto-prefix 2
;;         corfu-popupinfo-delay 0.5))

;; ;; Emacs completion style that matches multiple regexps in any order
;; (use-package orderless
;;   :ensure t
;;   :config
;;   (setq completion-styles '(orderless basic partial-completion)
;;         completion-category-overrides '((file (styles basic partial-completion)))
;;         orderless-component-separator "[ |]"))

;; ;; Consulting completing-read
;; (use-package consult
;;   :ensure t
;;   :bind (:map custom-bindings-map
;;               ("C-x b" . consult-buffer)
;;               ("C-c r" . consult-ripgrep))
;;   :config
;;   (setq consult-preview-key (list :debounce 0.1 'any)))




(provide 'edit)
;;; edit.el ends here
