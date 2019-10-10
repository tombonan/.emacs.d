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

;; Remap meta key to alt from command
(setq mac-option-modifier 'meta) 
(setq mac-command-modifier 'super) 

;; Move backups and autosaves to ~/.saves directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; Set documents to default working directory
(setq default-directory "~/Documents/")

;; Load custom directories
(mapc 'load (file-expand-wildcards "~/.emacs.d/defuns/*.el")) ;; emacs functions directory
(mapc 'load (file-expand-wildcards "~/.emacs.d/settings/*.el")) ;; emacs package settings directory

;; Dired Omit . Files
(add-hook 'dired-load-hook '(lambda () (require 'dired-x))) ; Load Dired X when Dired is loaded.
(add-hook 'dired-mode-hook
          (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 (dired-omit-mode 1)
		 (dired-hide-details-mode 1)
                 ))


;; Package requirements
(require 'neotree)
(require 'undo-tree)
(require 'restclient)
(require 'avy)
(require 'god-mode)
(require 'emmet-mode)
(require 'rjsx-mode)
(require 'smartparens-config)
(require 'p4)

;; Always start smartparens mode in js-mode.
(add-hook 'js-mode-hook #'smartparens-mode)

;; rsjx-mode for all js files
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . rjsx-mode))

;; Custom package hooks and initialization
(global-undo-tree-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Custom set variables
(setq custom-file "~/.emacs.d/settings/custom.el")
(load custom-file)
(put 'downcase-region 'disabled nil)
