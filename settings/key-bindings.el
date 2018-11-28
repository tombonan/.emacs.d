;; Custom keybindings
;; The C-c <SPC> prefix I'm leaving for major-mode-specific keybindings.

(global-set-key (kbd "C-c c") 'avy-goto-char) ;; c for char
(global-set-key (kbd "C-c l") 'helm-buffers-list) ;; l for list

(global-set-key (kbd "C-c g") 'magit-status) ;; g for git
(global-set-key (kbd "C-z") 'undo) ;; z for standard mac keybinding
(global-set-key (kbd "C-S-z") 'undo-tree-redo) ;; shift z to undo
(global-set-key (kbd "C-x u") 'undo-tree-visualize) ;; u for undo
(global-set-key (kbd "C-x C-j") 'neotree-toggle)
(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'tom/split-window-below-and-move-there)
(global-set-key (kbd "C-x C-3") 'tom/split-window-right-and-move-there)

;; key remappings
(global-set-key [remap goto-line] 'tom/goto-line-with-feedback)

;; Manipulating current buffer file
(global-set-key (kbd "C-x C-k") 'tom/delete-current-buffer-file)
(global-set-key (kbd "C-x C-r") 'tom/rename-current-buffer-file)

;; Move more quickly around buffer
(global-set-key (kbd "C-S-n")(lambda ()(interactive)(ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p")(lambda ()(interactive)(ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f")(lambda ()(interactive)(ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b")(lambda ()(interactive)(ignore-errors (backward-char 5))))

;; Comment/uncomment block
(global-set-key (kbd "C-c d") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c f") 'Uncomment-region)

;; Move lines up or down
(global-set-key (kbd "C-S-d") 'tom/move-line-down)
(global-set-key (kbd "C-S-u") 'tom/move-line-up)

;; New lines even if the cursor is midsentence
(global-set-key (kbd "C-RET") 'tom/open-line-below)
(global-set-key (kbd "C-S-RET") 'tom/open-line-above)

(provide 'key-bindings)
