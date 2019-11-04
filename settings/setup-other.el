;; Catch all for custom settings to keep init.el clean

;; Coffee script settings
(custom-set-variables '(coffee-tab-width 2))

;; Spectra Related Emacs Commands
(defun tom/spectra-creds ()
  (interactive)
  (find-file "~/Documents/creds.org"))

(global-set-key (kbd "C-c s") 'tom/spectra-creds)

;; restclient-mode setup
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(provide 'setup-other)
