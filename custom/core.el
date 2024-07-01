;; -*- lexical-binding: t -*-

(use-package doom-themes
  :ensure t)

(use-package emacs
  :ensure nil
  :init
  ;; deactivate "welcome" message at startup
  (setq inhibit-startup-message -1)
  ;; no tool-bar
  (tool-bar-mode -1)
  ;; no menu
  (menu-bar-mode -1)
  ;; no stroll bar
  (scroll-bar-mode -1)
  ;; turn off error bell notification
  (setq ring-bell-function 'ignore)
  ;; display line & column numbers in status line
  (setq column-number-mode t)
  ;; set relative line numbers mode
  (setq display-line-numbers-type 'visual)
  ;; highlight current line
  (global-hl-line-mode t)
  ;; set default font / size
  (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)
  ;; set color
  ;; (load-theme 'zenburn)
  ;;  (load-theme 'modus-operandi)
  (load-theme 'doom-nord)
  ;; set initial geometry
  (add-to-list 'default-frame-alist '(height . 114))
  (add-to-list 'default-frame-alist '(width . 250))
  ;; (add-to-list 'default-frame-alist '(width . 140))
  (add-to-list 'default-frame-alist '(top . 0))
  (add-to-list 'default-frame-alist '(left . 1814))
  ;; avoid making backup files - we do have git!
  (setq make-backup-files nil)
  (setq gc-cons-threshold (* 1000 1024 1024)
		read-process-output-max (* 1024 1024)
		create-lockfiles nil) ;; lock files will kill `npm start'
  ;; make return key also do indent, globally
  (electric-indent-mode 1)
  ;; make tab key do indent first then completion.
  (setq-default tab-always-indent 'complete)
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)
  (setq-default js-indent-level 2)  
  :config
  ;; use y-or-n instead yes-or-not
  (setopt use-short-ansewrs t)
  :hook
  (prog-mode . display-line-numbers-mode))

;; winum package
(use-package winum
  :ensure t
  :config
  (setq winum-scope 'frame-local)
  (global-set-key (kbd "C-M-0") 'winum-select-window-10)
  (global-set-key (kbd "C-M-1") 'winum-select-window-1)
  (global-set-key (kbd "C-M-2") 'winum-select-window-2)
  (global-set-key (kbd "C-M-3") 'winum-select-window-3)
  (global-set-key (kbd "C-M-4") 'winum-select-window-4)
  (global-set-key (kbd "C-M-5") 'winum-select-window-5)
  (global-set-key (kbd "C-M-6") 'winum-select-window-6)
  (global-set-key (kbd "C-M-7") 'winum-select-window-7)
  (global-set-key (kbd "C-M-8") 'winum-select-window-8)
  (global-set-key (kbd "C-M-9") 'winum-select-window-9)
  (winum-mode))

(use-package projectile
  :ensure t)

(provide 'core)
;; core.el end here
