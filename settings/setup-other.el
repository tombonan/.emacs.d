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

;; perl-mode setup
(defun perl-space-hook ()
    (setq indent-tabs-mode nil)
    (setq tab-width 3))
(add-hook 'perl-mode-hook 'perl-space-hook)

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(put 'upcase-region 'disabled nil)

(provide 'setup-other)
