;; Defaults

;; Move backups and autosaves to ~/.saves directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

;; Move undo history to ~/.undo directory
(setq undo-tree-history-directory-alist '(("." . "~/.undo/")))

;; Set documents to default working directory
(setq default-directory "~/Documents/")

;; Delete whitespace upon saving
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'defaults)
