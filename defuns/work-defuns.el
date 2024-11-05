;; Any one-off work-related defuns

;; TODO: Add file descriptor in the file name
(defun tom/create-jira-org-file (jira-ticket-id)
  "Create a new org-mode file template for a given Jira ticket ID and open it in the current buffer."
  (interactive "sEnter Jira Ticket ID: ")
  (let ((file-path (expand-file-name (concat jira-ticket-id ".org") "~/Dropbox/org/tickets"))
        (file-contents (concat "#+STARTUP: showeverything\n"
                               "#+OPTIONS: ^:nil\n\n"
                               "* " jira-ticket-id "\n"
                               "[[https://redcanary.atlassian.net/browse/" jira-ticket-id "][Jira Link]]\n"
                               "\n"
                               "* Some Header\n"
                               "#+BEGIN_SRC ruby\n"
                               "#+END_SRC\n"
                               )))
    (with-temp-file file-path
      (insert file-contents))
    (find-file file-path)
    (message "Created and opened file: %s" file-path)))

(provide 'buffer-defuns)
