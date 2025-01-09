;; Custom cron-like actions

;; Screenshot cleanup
(when (file-executable-p "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner")
  (defun run-shell-command-every-15-minutes ()
    "Run a shell command every 15 minutes."
    (shell-command "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner"))

  (run-at-time "0 min" (* 15 60) 'run-shell-command-every-15-minutes))

(provide 'cron)
