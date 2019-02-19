;; Org-mode Configuration

(require 'org)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Load all org files for global todo list
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
(load-library "find-lisp")
(setq org-agenda-files
   (find-lisp-find-files "~/Dropbox/org/" "\.org$"))

(provide 'setup-org)
