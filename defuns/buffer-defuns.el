;; Buffer-related defuns

(defun tom/up-directory () ;; Move open up dired one directory up
  (interactive)
  (if (string= major-mode "dired-mode")
      (call-interactively 'dired-up-directory)
    (find-file ".")))

(defun tom/split-window-right-and-move-there ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun tom/split-window-below-and-move-there ()
  (interactive)
  (split-window-below)
  (windmove-below))

(defun tom/kill-other-buffers ()
    "Kill all buffers except for current"
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

(provide 'buffer-defuns)
