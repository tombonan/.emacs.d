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

;; Timestamp when closing todo
(setq org-log-done 'time)

;; Use org-bullets instead of asterisks
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented t
      org-ellipsis " ▾ " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t) ;; Hide emphasis markers

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Roboto Mono Medium" :weight regular)))))
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; Add in progress to TODO sequence
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

(provide 'setup-org)
