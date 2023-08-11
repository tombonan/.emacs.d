;; Projectile Mode Configuration

(require 'projectile)

(projectile-mode +1)

(defun tom/projectile-ignore-tmp-projects (project-root)
  "Return non-nil if PROJECT-ROOT is in the /tmp directory."
  (string-prefix-p "/private/tmp/" project-root))

(setq projectile-ignored-project-function #'tom/projectile-ignore-tmp-projects)
(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq projectile-globally-ignored-directories
      (append '(
        ".git"
        "node_modules"
        "venv"
        )
          projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
      (append '(
        ".DS_Store"
        "*.gz"
        "*.pyc"
        "*.jar"
        "*.tar.gz"
        "*.tgz"
        "*.zip"
        )
          projectile-globally-ignored-files))

(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-mode-line "Projectile")

;; Sort files by recently acitve buffers, then recently opened files
(setq projectile-sort-order 'recently-active)

(provide 'setup-projectile)
