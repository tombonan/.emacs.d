(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("MELPA" .
      "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Solarize theme
(load-theme 'solarized-light t)

;; Disable Tool Bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Move backups to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))

;; Move autosaves to ~/.saves
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; Maximize Screen on Startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set default working directory
(setq default-directory "~/Documents")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "944e706816bc594367bc16a745b746a38aecc55b9ed5b5209e05289df22a5c52" default)))
 '(package-selected-packages
   (quote
    (multiple-cursors magit restclient neotree direx emmet-mode helm-ag helm-projectile avy web-mode projectile-rails solarized-theme god-mode helm helm-ebdb))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-buffer-id ((t (:foreground "cornsilk" :weight bold)))))

(setq mac-option-modifier 'meta) ; set alt-key to meta
(setq mac-command-modifier nil) ; set cmd-key to nil

;; Helm Configuration
(require 'helm)
(require 'helm-config)
(require 'helm-ag)

;; God-mode Configuration
(require 'god-mode)

;; Emmet Configuration
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Toggle God-mode with alt-space
(global-set-key (kbd "M-SPC") 'god-mode-all) ;;Set Globally
(define-key god-local-mode-map (kbd "i") 'god-mode-all) ;;Kill by pressing 'i' in God Mode

;;God-mode change Mode Line
(defun tom/update-cursor ()
  (if god-local-mode
      (progn (setq cursor-type 'box)
	     (set-face-background 'mode-line "firebrick")
	     (set-face-foreground 'mode-line "white"))
    (progn (setq cursor-type 'bar)
	   (set-face-background 'mode-line "steelblue3")
	   (set-face-foreground 'mode-line "white"))))

(add-hook 'god-mode-enabled-hook 'tom/update-cursor)
(add-hook 'god-mode-disabled-hook 'tom/update-cursor)

;; The Default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

;;Web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Avy character set
(require 'avy)

;; Dired Omit . Files
(add-hook 'dired-load-hook '(lambda () (require 'dired-x))) ; Load Dired X when Dired is loaded.
(add-hook 'dired-mode-hook
               (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 (dired-omit-mode 1)
		 (dired-hide-details-mode 1)
                 ))

;; (require 'direx)
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; Neotree Configuration
(require 'neotree)
(global-set-key (kbd "C-x C-j") 'neotree-toggle)

;; Restclient Configuration
(require 'restclient)

;; Multiple Cursors Configuration
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; Add cursor to each line in region selection
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; Add cursor to non-continuous selection
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil) ;; Disable only with C-g

;; Custom functions
(defun tom/up-directory () ;; Move open up dired one directory up
  (interactive)
  (if (string= major-mode "dired-mode")
      (call-interactively 'dired-up-directory)
    (find-file ".")))

;; Custom keybindings
;; The C-c <SPC> prefix I'm leaving for major-mode-specific keybindings.

(global-set-key (kbd "C-c c") 'avy-goto-char) ;; c for char
(global-set-key (kbd "C-c d") 'avy-goto-char-2) ;; d for double char
(global-set-key (kbd "C-c L") 'avy-goto-line) ;; L for line
(global-set-key (kbd "C-c s") 'avy-goto-char-timer) ;; s for search
(global-set-key (kbd "C-c l") 'helm-buffers-list) ;; l for list
(global-set-key (kbd "C-c u") 'tom/up-directory) ;; U for Up
(global-set-key (kbd "C-c p") 'helm-projectile) ;; P for project

(global-set-key (kbd "C-x g") 'magit-status) ;; G for Git

(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
