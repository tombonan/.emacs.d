;; Custom git functions
(require 'magit)

(defun tom/git-open (&optional remote)
  "Open the current buffer file from the git branch on the given remote on Github in a web browser.
   If remote is nil or not provided, use the 'origin' remote by default.
   Inspired by: https://github.com/paulirish/git-open"
  (interactive)
  (let ((remote (or remote "origin"))
        (remote-branch (magit-get-current-branch)))
    (if (not remote-branch)
        (message "Error: not in a Git repository.")
      (let ((remote-url (magit-git-string "config" "--get" (concat "remote." remote ".url"))))
        (if (not remote-url)
            (message "Error: remote URL not found.")
          (let* ((default-directory (magit-toplevel))
                 (relative-file-path (file-relative-name buffer-file-name))
                 (remote-url (replace-regexp-in-string "^git@github.com:" "https://github.com/" remote-url))
                 (remote-url (replace-regexp-in-string "\\.git$" "" remote-url))
                 (remote-file-url (concat remote-url "/blob/" remote-branch "/" relative-file-path)))
            (browse-url remote-file-url)
            (message "Opened %s in web browser." remote-file-url)))))))
