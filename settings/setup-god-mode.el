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

;; helm-projectile-switch-project chains two helm sessions; guard with helm-alive-p
;; so only the first session captures god-mode state, not the chained second one.
(defvar tom/god-mode-was-active nil)

(add-hook 'helm-before-initialize-hook
	  (lambda ()
	    (unless helm-alive-p
	      (setq tom/god-mode-was-active (bound-and-true-p god-local-mode)))))

(add-hook 'helm-after-action-hook
	  (lambda ()
	    (when tom/god-mode-was-active
	      (run-with-idle-timer 0 nil
		(lambda ()
		  (unless (bound-and-true-p god-local-mode)
		    (god-local-mode 1))
		  (setq tom/god-mode-was-active nil))))))

(add-hook 'helm-quit-hook
	  (lambda ()
	    (when tom/god-mode-was-active
	      (god-local-mode 1)
	      (setq tom/god-mode-was-active nil))))

;; Start god mode on boot
(god-mode)

(provide 'setup-god-mode)
