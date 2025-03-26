;; Projectile Mode Configuration

(require 'projectile)

(projectile-mode +1)

(defun tom--projectile-ignore-projects (project-root)
  "Ignored projectile projects"
  (or (string-prefix-p "/private/tmp/" project-root)
      (string-match-p "\\.asdf" project-root)))

(setq projectile-ignored-project-function #'tom--projectile-ignore-projects)

(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)

(setq projectile-globally-ignored-directories
      (append '(
        ".git"
        "node_modules"
        "venv"
        )
          projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
      (append '(
        ".DS_Store"
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

;; Load projects
(projectile-load-known-projects)
(projectile--cleanup-known-projects)
(when projectile-auto-discover
  (projectile-discover-projects-in-search-path))

;; Sort files by recently acitve buffers, then recently opened files
(setq projectile-sort-order 'recently-active)

(setq projectile-enable-caching 'persistent)

;; Invalidate the cache when checking out a new branch
;; https://emacs.stackexchange.com/a/26272
(defun run-projectile-invalidate-cache (&rest _args)
  ;; We ignore the args to `magit-checkout'.
  (projectile-invalidate-cache nil))
(advice-add 'magit-checkout
            :after #'run-projectile-invalidate-cache)
(advice-add 'magit-branch-and-checkout ; This is `b c'.
            :after #'run-projectile-invalidate-cache)

;; Overwrite keybinding (muscle memory for helm-projectile-grep)
(with-eval-after-load 'projectile
  (define-key projectile-command-map (kbd "s g") #'helm-projectile-rg))

(provide 'setup-projectile)
