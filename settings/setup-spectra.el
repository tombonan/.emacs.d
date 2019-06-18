;; Spectra Related Emacs Commands

(defun tom/spectra-creds ()
  (interactive)
  (find-file "~/Documents/creds.org"))

(global-set-key (kbd "C-c s") 'tom/spectra-creds)

(provide 'setup-spectra)
