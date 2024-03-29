;; Buffer-related defuns
(require 'cl)

(defun tom/up-directory () ;; Move open up dired one directory up
  (interactive)
  (if (string= major-mode "dired-mode")
      (call-interactively 'dired-up-directory)
    (find-file ".")))

(defun tom/open-emacs-config () ;; Open emacs config file
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun tom/open-org-default () ;; Open default org/notes.org file
  (interactive)
  (find-file "~/Dropbox/org/notes.org"))

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
  (call-interactively 'tom/kill-star-buffers)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

(defun tom/goto-percent (percent)
  "Go to PERCENT of buffer."
  (interactive "nGoto percent: ")
  (goto-char (/ (* percent (point-max)) 100)))


(defvar kill-star-buffers-except
  '("\\`\\*scratch\\*\\'"
    "\\`\\*Messages\\*\\'"
    "\\` \\*Minibuf-[[:digit:]]+\\*\\'"
    "\\` \\*Echo Area [[:digit:]]+\\*\\'")
  "Exception list for `kill-star-buffers'")

(defun tom/kill-star-buffers ()
  "Kill all star buffers except those in `kill-star-buffers-except'"
  (interactive)
  (mapc (lambda (buf)
          (let ((buf-name (buffer-name buf)))
            (when (and
                   ;; if a buffer's name is enclosed by * with optional leading
                   ;; space characters
                   (string-match-p "\\` *\\*.*\\*\\'" buf-name)
                   ;; and the buffer is not associated with a process
                   ;; (suggested by "sanityinc")
                   (null (get-buffer-process buf))
                   ;; and the buffer's name is not in `kill-star-buffers-except'
                   (notany (lambda (except) (string-match-p except buf-name))
                           kill-star-buffers-except))
              (kill-buffer buf))))
        (buffer-list)))

;; Running tests in buffer
(defun tom/test-this-file (test-cmd &optional line-num)
  "Navigate to the project root and run the current file with the specified test command.
   If an optional line number param is passed, then the test commmand is run at that section"
  (let ((shell-cmd (concat "cd " (projectile-project-root) " && " test-cmd " " (buffer-file-name))))
    (if line-num
        (compile (concat shell-cmd ":" line-num))
      (compile shell-cmd))))

(defun tom/unittest-this-file ()
  "Run the current file in unittest using a virtual environment venv/"
  (interactive)
  (tom/test-this-file "venv/bin/python -m unittest"))

(defun tom/rspec-this-file ()
  "Run the current file in rspec"
  (interactive)
  (tom/test-this-file "bundle exec rspec"))

(defun tom/jest-this-file ()
  "Run the current file in jest"
  (interactive)
  (tom/test-this-file "./node_modules/.bin/jest"))

(defun tom/rspec-this-line ()
  "Run an rspec block at the current cursor position"
  (interactive)
  (tom/test-this-file "bundle exec rspec" (format-mode-line "%l")))

(provide 'buffer-defuns)
