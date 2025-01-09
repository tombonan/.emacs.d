;; Custom cron-like actions

;; Screenshot cleanup
(when (file-executable-p "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner")
  (defun tom/screenshot-clean ()
    (shell-command "/Users/tombonan/github/dotfiles/bin/screenshot-cleaner"))

  ;; Run every 15 min
  (run-at-time "0 min" (* 15 60) 'tom/screenshot-clean))

(provide 'cron)
