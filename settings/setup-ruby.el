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

(provide 'setup-ruby)
