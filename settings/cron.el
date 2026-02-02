;; Custom cron-like actions

;; Screenshot cleanup
(when (file-executable-p "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner")
  (defun tom/screenshot-clean ()
    (shell-command "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner"))

  ;; Run every 15 min
  (run-at-time "0 min" (* 15 60) 'tom/screenshot-clean))

;; Claude code backups
(when (file-executable-p "/Users/tombonan/github/dotfiles/bin/backup-claude-configs")
  (defun tom/claude-backup ()
    (shell-command "/Users/tombonan/github/dotfiles/bin/backup-claude-configs"))

  ;; Run every 15 min
  (run-at-time "0 min" (* 3 60 60) 'tom/claude-backup))

(provide 'cron)
