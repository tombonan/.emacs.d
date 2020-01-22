;; Custom keybindings
;; The C-c <SPC> prefix I'm leaving for major-mode-specific keybindings.

(global-set-key (kbd "C-c c") 'avy-goto-char) ;; c for char
(global-set-key (kbd "C-c c") 'avy-goto-line) ;; f for find
(global-set-key (kbd "C-c l") 'helm-buffers-list) ;; l for list
(global-set-key (kbd "C-s") 'helm-swoop) ;; h p for helm project

(global-set-key (kbd "C-c g") 'magit-status) ;; g for git
(global-set-key (kbd "C-z") 'undo) ;; z for standard mac keybinding
(global-set-key (kbd "C-S-z") 'undo-tree-redo) ;; shift z to undo
(global-set-key (kbd "C-x u") 'undo-tree-visualize) ;; u for undo
(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'tom/split-window-below-and-move-there)
(global-set-key (kbd "C-x C-3") 'tom/split-window-right-and-move-there)

;; key remappings
(global-set-key [remap goto-line] 'tom/goto-line-with-feedback)

;; Manipulating current buffer file
(global-set-key (kbd "C-x C-k") 'tom/delete-current-buffer-file)
(global-set-key (kbd "C-x C-r") 'tom/rename-current-buffer-file)
(global-set-key (kbd "C-x t") 'tom/touch-buffer-file)

;; Move more quickly around buffer
(global-set-key (kbd "C-S-n")(lambda ()(interactive)(ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p")(lambda ()(interactive)(ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f")(lambda ()(interactive)(ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b")(lambda ()(interactive)(ignore-errors (backward-char 5))))

;; Comment/uncomment block
(global-set-key (kbd "C-c d") 'comment-or-uncomment-region)

;; Move lines up or down
(global-set-key (kbd "C-S-d") 'tom/move-line-down)
(global-set-key (kbd "C-S-u") 'tom/move-line-up)

;; Join line below to current line
(global-set-key (kbd "C-c j")(lambda ()(interactive)(join-line -1)))

;; New lines even if the cursor is midsentence
(global-set-key (kbd "C-RET") 'tom/open-line-below)
(global-set-key (kbd "C-S-RET") 'tom/open-line-above)

;; Move windows, even in org-mode
(global-set-key (kbd "C-x o") 'windmove-right) ;; o for other
(global-set-key (kbd "C-x i") 'windmove-left) ;; p for previous
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;; Org Mode
(global-set-key (kbd "C-c a") 'org-agenda) ;; a for agenda
(global-set-key (kbd "C-c t") 'org-todo-list) ;; t for todo

;; Dired commands
(global-set-key (kbd "C-c C-j") 'dired-jump) (autoload 'dired-jump "dired") ;; j for jump

;; Smartparens
(global-set-key (kbd "C-c )") 'sp-splice-sexp) ;; delete open and close tags around cursor

;; Open files or directories
(global-set-key (kbd "C-c o") 'tom/open-org-default) ;; o for org
(global-set-key (kbd "C-c e") 'tom/open-emacs-config) ;; e for emacs

;; Ruby Keybindings
(global-set-key (kbd "C-c r") 'tom/rspec-this-file) ;; r for rspec

(provide 'key-bindings)
