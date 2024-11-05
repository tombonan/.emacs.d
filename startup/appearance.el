;; Appearance

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

;; Don't beep. Just blink the modeline on errors.
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Turn off blinking cursor
(blink-cursor-mode -1)

;; Font
(add-to-list 'default-frame-alist
             '(font . "Monaco"))

;; Disable bold
(set-face-attribute 'default nil :weight 'normal)

;; Apply bold disable to all major modes
(defun appearance/disable-all-bold-faces ()
  "Disable bolding for all faces."
  (interactive)
  (mapc (lambda (face)
          (set-face-attribute face nil :weight 'normal))
        (face-list)))

(add-hook 'after-load-theme-hook 'appearance/disable-all-bold-faces)
(add-hook 'after-change-major-mode-hook 'appearance/disable-all-bold-faces)

(provide 'appearance)
