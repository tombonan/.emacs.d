;; Remap meta key to alt from command
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

(provide 'mac)
