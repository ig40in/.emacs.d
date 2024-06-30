;; -*- lexical-binding: t -*-

(use-package org
  :ensure t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(provide 'orgm)
;; orgm.el ends here
