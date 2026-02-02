;; open magit buffer as full-screen
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

;; Custom function to check for the default branch, checkout that branch, and pull from origin.
(defun tom/checkout-and-pull-default ()
  "Checkout the master branch and pull from origin/master."
  (interactive)
  (let* ((default-branch
          (string-trim
           (shell-command-to-string
            "git remote show origin | grep 'HEAD branch' | awk '{print $NF}'"))))
    (magit-run-git "checkout" default-branch)
    (magit-run-git "pull" "origin" default-branch)))

(provide 'setup-magit)
