;; Multiple Cursors Configuration
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; Add cursor to each line in region selection
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; Add cursor to non-continuous selection
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil) ;; Disable only with C-g

(provide 'setup-multiple-cursors)
