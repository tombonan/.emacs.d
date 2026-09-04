;; Set up restclient mode with custom env handling
;;
;; Usage:
;; :api-key := (getenv "API_KEY")
;;
(require 'restclient)
(require 'restclient-jq)

(use-package restclient
  :straight t
  :mode ("\\.http\\'" . restclient-mode)
  :custom
  (restclient-enable-eval t))

(defvar tom/restclient-env-dir (expand-file-name "~/.restclient/")
  "Directory for restclient environment files.")

(defvar tom/restclient-env-file (expand-file-name ".env" tom/restclient-env-dir)
  "Path to the restclient environment file.")

(defun tom/ensure-restclient-env ()
  "Create ~/.restclient/ and ~/.restclient/.env if they don't exist."
  (unless (file-directory-p tom/restclient-env-dir)
    (make-directory tom/restclient-env-dir t))
  (unless (file-exists-p tom/restclient-env-file)
    (with-temp-file tom/restclient-env-file
      (insert "# restclient environment variables\n# Format: KEY=value\n\n"))))

(defun tom/load-restclient-env ()
  "Load environment variables from ~/.restclient/.env into the current process."
  (interactive)
  (tom/ensure-restclient-env)
  (let ((count 0))
    (with-temp-buffer
      (insert-file-contents tom/restclient-env-file)
      (dolist (line (split-string (buffer-string) "\n" t))
        (when (string-match "^\\([^#][^=]*\\)=\\(.*\\)$" line)
          (setenv (string-trim (match-string 1 line))
                  (string-trim (match-string 2 line)))
          (setq count (1+ count)))))
    (message "restclient: loaded %d variable(s) from %s" count tom/restclient-env-file)))

(defun tom/open-restclient-env ()
  "Open ~/.restclient/.env for editing."
  (interactive)
  (tom/ensure-restclient-env)
  (find-file tom/restclient-env-file))

;; Load on init
(tom/ensure-restclient-env)
(tom/load-restclient-env)

;; Evaluate when executing restclient commands
(add-hook 'restclient-http-do-hook #'tom/load-restclient-env)

(provide 'setup-restclient)
