;; Configure packages from version control

(unless (package-installed-p 'emacs-git-open)
  (package-vc-install "https://github.com/tombonan/emacs-git-open"))

(require 'emacs-git-open)

(provide 'vc-packages)
