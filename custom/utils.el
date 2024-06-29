;;------------------------------------------------------------------------------
;; personal macros
;;------------------------------------------------------------------------------

;; comment line
(defun toggle-comment-on-line ()
  "toggle comment on current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)


;; comments header
;;(defalias 'ig40in-comments-header
;;   (kmacro "M-; <backspace> C-7 C-8 - <return> M-; <return> M-; <backspace> C-7 C-8 - C-p SPC"))

(global-set-key (kbd "M-o") 'other-window)
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defalias 'kill-current-word
     (kmacro "M-b C-SPC M-f C-w"))
(global-set-key (kbd "M-<delete>")   'kill-current-word)

(defalias 'ig40in-dev-layout
  (kmacro "C-x 2 C-2 C-0 C-x ^ M-o M-x m u l t <tab> v <tab> <return> M-o C-x 3"))

(defalias 'ig40in-new-line-below
   (kmacro "C-e <return>"))
(global-set-key (kbd "C-o") 'ig40in-new-line-below)



;; Move current line up or down
;; by Boxhidar Batsov
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(global-set-key [(meta shift up)] 'move-line-up)

(defun move-line-down ()
  "Move down the current line"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(meta shift down)] 'move-line-down)


;; evaluate current buffer
(define-key global-map (kbd "<f5>") #'eval-buffer)


(provide 'utils)
;; utils.el ends here

