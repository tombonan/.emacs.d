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

;; Beautiful org-mode appearance (inspired by zzamboni.org)
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
;; https://github.com/zzamboni/dot-emacs
(setq org-startup-indented t
      org-ellipsis " ▾" ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t ;; Hide emphasis markers
      org-indent-indentation-per-level 4 ;; Better visual hierarchy
      org-cycle-hide-drawer-startup t) ;; Hide drawers (properties) by default

;; Use org-bullets for beautiful headline markers
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Beautify checkboxes
(font-lock-add-keywords 'org-mode
                        '(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?: \\|X\\|[-]\\)\\]\\)"
                           1 (progn (compose-region (match-beginning 1) (match-end 1)
                                                    (pcase (match-string 2)
                                                      ("X" "☑")
                                                      ("-" "⊡")
                                                      (_ "☐")))
                                    nil))))

;; Strikethrough for checked items
(font-lock-add-keywords 'org-mode
                        '(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[X\\]\\(.*\\)$"
                           1 '(:strike-through t :foreground "#71696A") prepend)))


;; Set faces for heading levels with dramatic size differences
;; cp ~/Downloads/ETBembo-RomanLF.otf ~/Library/Fonts/
;; https://github.com/DavidBarts/ET_Bembo/blob/master/ETBembo-RomanLF.otf
(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

;; Set faces for other org elements
(custom-theme-set-faces
 'user
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :background "#ddd8eb" :foreground "#9380b2" :extend t :overline nil :underline nil))))
 '(org-block-end-line ((t (:inherit fixed-pitch :background "#ddd8eb" :foreground "#9380b2" :extend t :overline nil :underline nil))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit fixed-pitch :foreground "#93a1a1" :height 0.8))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-drawer ((t (:inherit fixed-pitch :foreground "#93a1a1" :height 0.7))))
 '(org-headline-done ((t (:foreground "PaleGreen" :strike-through t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit fixed-pitch :foreground "#93a1a1" :height 0.7))))
 '(org-property-value ((t (:inherit fixed-pitch :height 0.8))) t)
 '(org-special-keyword ((t (:inherit fixed-pitch :foreground "#93a1a1" :height 0.7))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; Enable variable-pitch mode and visual-line-mode for org
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

;; Add line spacing for better readability
(add-hook 'org-mode-hook (lambda () (setq line-spacing 0.1)))

;; Add in progress to TODO sequence
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))

(setq org-startup-folded 'showeverything) ;; Show it to me

(setq org-use-sub-superscripts nil) ;; Disable superscripts (coding)

(provide 'setup-org)
