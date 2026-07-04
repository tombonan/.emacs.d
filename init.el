;; Bootstrap straight.el
;; https://github.com/radian-software/straight.el#bootstrapping-straightel
;;
;; - M-x straight-pull-all — pulls latest commits for all packages
;; - M-x straight-pull-package — pulls a single package
;; - M-x straight-rebuild-all — recompiles everything
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Add startup to load-path
(add-to-list 'load-path (expand-file-name "startup" user-emacs-directory))

;; Start up quickly
(require 'fast-startup)

;; Solarized must be available before appearance loads
(straight-use-package 'solarized-theme)

;; Set up appearance early
(require 'appearance)

;; Load defaults
(require 'defaults)

;; Load custom directories
(mapc 'load (file-expand-wildcards "~/.emacs.d/defuns/*.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/settings/*.el"))

;; Package requirements
(require 'neotree)
(require 'undo-tree)
(require 'restclient)
(require 'restclient-jq)
(require 'avy)
(require 'god-mode)
(require 'emmet-mode)
(require 'rjsx-mode)
(require 'smartparens-config)
(require 'expand-region)

;; Custom package hooks and initialization
(global-undo-tree-mode)

;; Custom set variables
(setq custom-file "~/.emacs.d/settings/custom.el")
(load custom-file)

;; Require newline at end of file
(setq require-final-newline t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
