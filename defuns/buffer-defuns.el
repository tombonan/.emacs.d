;; Buffer-related defuns

(defun tom/up-directory () ;; Move open up dired one directory up
  (interactive)
  (if (string= major-mode "dired-mode")
      (call-interactively 'dired-up-directory)
    (find-file ".")))

(provide 'buffer-defuns)
