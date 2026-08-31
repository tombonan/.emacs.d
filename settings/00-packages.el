;; Core
(straight-use-package 'undo-tree)
(straight-use-package 'neotree)
(straight-use-package 'avy)
(straight-use-package 'god-mode)
(straight-use-package 'expand-region)
(straight-use-package 'smartparens)
(straight-use-package 'multiple-cursors)
(straight-use-package 'bufferfile)
(straight-use-package 'compat)

;; Git
(straight-use-package 'magit)
(straight-use-package
 '(emacs-git-open :type git :host github :repo "tombonan/emacs-git-open"))

;; Helm
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(straight-use-package 'helm-rg)
(straight-use-package 'helm-swoop)
(straight-use-package 'helm-projectile)

;; Project
(straight-use-package 'projectile)
(straight-use-package 'flycheck)
(straight-use-package 'kubernetes)

;; Web/frontend
(straight-use-package 'web-mode)
(straight-use-package 'emmet-mode)
(straight-use-package 'rjsx-mode)
(straight-use-package 'typescript-mode)
(straight-use-package 'restclient)
(straight-use-package 'restclient-jq)

;; Language modes
(straight-use-package 'yaml-mode)
(straight-use-package 'json-mode)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'terraform-mode)
(straight-use-package 'clojure-mode)
(straight-use-package 'cider)
(straight-use-package 'clj-refactor)
(straight-use-package 'coffee-mode)
(straight-use-package 'markdown-mode)
(straight-use-package 'go-mode)

;; Org
(straight-use-package 'org-bullets)

;; Misc
(straight-use-package 'sqlformat)
(straight-use-package 'dotenv-mode)
(straight-use-package 'arduino-mode)

(provide '00-packages)
