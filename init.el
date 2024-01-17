(require 'package)

;; Add startup to load-path
(add-to-list 'load-path (expand-file-name "startup" user-emacs-directory))

;; Start up quickly
(require 'fast-startup)

;; Set up appearance early
(require 'appearance)

;; Load defaults
(require 'defaults)

;; Any add to list for package-archives (to add marmalade or melpa) goes here
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))
(package-initialize)

;; Load custom directories
(mapc 'load (file-expand-wildcards "~/.emacs.d/defuns/*.el")) ;; emacs functions directory
(mapc 'load (file-expand-wildcards "~/.emacs.d/settings/*.el")) ;; emacs package settings directory

;; Package requirements
(require 'neotree)
(require 'undo-tree)
(require 'restclient)
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
