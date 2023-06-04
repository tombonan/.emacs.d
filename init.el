(require 'package)

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

;; Solarize theme
(load-theme 'solarized-light t)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Maximize Screen on Startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; No splash screen
(setq inhibit-startup-message t)

;; Move backups and autosaves to ~/.saves directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; Move undo history to ~/.undo directory
(setq undo-tree-history-directory-alist '(("." . "~/.undo/")))

;; Set documents to default working directory
(setq default-directory "~/Documents/")

;; Delete whitespace upon saving
(add-hook 'before-save-hook 'whitespace-cleanup)

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
(require 'docker-tramp)
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
