;; Buffer-related defuns

(defun tom/up-directory () ;; Move open up dired one directory up
  (interactive)
  (if (string= major-mode "dired-mode")
      (call-interactively 'dired-up-directory)
    (find-file ".")))

(defun tom/open-emacs-config () ;; Open emacs config file
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun tom/split-window-right-and-move-there ()
  (interactive)
  (call-interactively 'split-window-right)
  (call-interactively 'windmove-right))

(defun tom/split-window-below-and-move-there ()
  (interactive)
  (call-interactively 'split-window-below)
  (call-interactively 'windmove-down))

(defun tom/kill-other-buffers ()
    "Kill all buffers except for current"
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

(provide 'buffer-defuns)
