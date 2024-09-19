;;; packages.el --- setup packages repositories -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
;; set of repositories
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

;; initialize pacckage manager
(package-initialize)
;; refresh packages' content
(when (not package-archive-contents)
  (package-refresh-contents))

(provide 'packages)
;;; packages.el ends here
