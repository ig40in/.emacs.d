;;; core.el --- main settings  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package nano-theme
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
  ;; (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 140)
  ;; (set-face-attribute 'default nil :font "Robotomono Nerd Font Mono" :height 140)
  ;; ;; set color
  (load-theme 'doom-zenburn)
 ;; (load-theme 'modus-operandi)
 ;; (load-theme 'nano-dark)
 ;; (load-theme 'nano-light)
  
 (setq default-frame-alist
       (append (list '(height . 90) '(width . 200) ;;'(width . 250)
                     '(top . 0) '(left . 1814)
                     '(vertical-scroll-bar . nil)
                     '(font . "Robotomono Nerd Font Mono 13")
                     )))
  
  ;; avoid making backup files - we do have git!
  (setq make-backup-files nil)
  (setq create-lockfiles nil)
  (setq auto-save-default nil)
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
  (setq-default major-mode 'text-mode)
  :config
  ;; use y-or-n instead yes-or-not
  (setopt use-short-ansewrs t)
  :hook
  (prog-mode . display-line-numbers-mode)
  (prog-mode . electric-indent-mode)
  (text-mode . 'turn-on-auto-fill))


;; normally the PATH in nixos contains everything we'd like (e.g. rg, direnv),
;; but on mac that's not true, so load the PATH that the shell would have and
;; rely on bash/zsh/fishrc
(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :init
  (exec-path-from-shell-initialize))

;; vterm & multi-vterm
(use-package vterm
  :ensure t)

(use-package multi-vterm
  :ensure t)

(use-package magit
  :ensure t)

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



(provide 'core)
;;; core.el ends here
