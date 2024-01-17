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

(provide 'appearance)
