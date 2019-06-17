;; Projectile Mode Configuration

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Sort files by recently acitve buffers, then recently opened files
(setq projectile-sort-order 'recently-active)


(provide 'setup-projectile)
