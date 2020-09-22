;; Projectile Mode Configuration

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Ignore node_modules
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(setq projectile-mode-line "Projectile")

;; Sort files by recently acitve buffers, then recently opened files
(setq projectile-sort-order 'recently-active)

(provide 'setup-projectile)
