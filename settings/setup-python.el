;; Python Hook
(add-hook 'python-mode-hook
      (lambda ()
	(setq indent-tabs-mode nil)
	(setq python-indent-offset 4)))

(provide 'setup-python)
