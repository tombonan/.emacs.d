;; Custom keybindings
;; The C-c <SPC> prefix I'm leaving for major-mode-specific keybindings.

(global-set-key (kbd "C-c c") 'avy-goto-char) ;; c for char
(global-set-key (kbd "C-c d") 'avy-goto-char-2) ;; d for double char
(global-set-key (kbd "C-c L") 'avy-goto-line) ;; L for line
(global-set-key (kbd "C-c s") 'avy-goto-char-timer) ;; s for search
(global-set-key (kbd "C-c l") 'helm-buffers-list) ;; l for list
(global-set-key (kbd "C-c u") 'tom/up-directory) ;; U for Up
(global-set-key (kbd "C-c p") 'helm-projectile) ;; P for project

(global-set-key (kbd "C-c g") 'magit-status) ;; g for git
(global-set-key (kbd "C-z") 'undo) ;; z for standard mac keybinding
(global-set-key (kbd "C-S-z") 'undo-tree-redo) ;; shift z to undo
(global-set-key (kbd "C-x u") 'undo-tree-visualize) ;; u for undo

(global-set-key (kbd "C-x C-r") 'tom/rename-current-buffer-file)

(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)

(provide 'key-bindings)
