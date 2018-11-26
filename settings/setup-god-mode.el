(require 'god-mode)

;; Toggle god-mode with alt-space
(global-set-key (kbd "M-SPC") 'god-mode-all) ;;Set Globally
(define-key god-local-mode-map (kbd "i") 'god-mode-all) ;;Kill by pressing 'i' in God Mode

;;god-mode change mode Line
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

(provide 'setup-god-mode)
