;; Ruby Block Highlighting
;; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))

(require 'ruby-block)
(ruby-block-mode t)

;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)

;; Coffee-mode hooks
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))

;; Custom ruby-mode hooks for config files
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))

(setq ruby-insert-encoding-magic-comment nil)
;; (setq enh-ruby-add-encoding-comment-on-save nil)

;; Custom Ruby navigation helpers
(defvar clean-relative-path-mappings
  '(("^app/" . "")
    ("controllers/" . "requests/"))
  "Mappings used for cleaning relative paths in `clean-relative-path`.")

(defun clean-relative-path (relative-path)
  "Remap the relative path of a file in app/ to a corresponding relative filepath for an
   RSpec test file."
  (let ((cleaned-path relative-path))
    (dolist (mapping clean-relative-path-mappings)
      (setq cleaned-path (replace-regexp-in-string (car mapping) (cdr mapping) cleaned-path)))
    cleaned-path))

(defun tom/open-rspec-file ()
  "Opens a corresponding RSpec file in the buffer.

   Assumes:
     - Project uses proectile
     - Tests are placed in the /spec directory of the project root
     - Controller specs are namespaced in a 'requests' directory
  "
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (string-match "\\(.*\\)\\.rb$" file-name)
        (let* ((base-name (match-string 1 file-name))
               (project-root (projectile-project-root))
               (relative-path (file-relative-name base-name project-root))
               (test-path (concat "spec/" (clean-relative-path relative-path) "_spec.rb")))
          (find-file-other-window (expand-file-name test-path project-root)))
      (message "Not a Ruby file."))))

(provide 'setup-ruby)
