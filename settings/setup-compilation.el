;; Settings for emacs compilation
;; http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html

(require 'ansi-color)

(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
	  #'endless/colorize-compilation)

(provide 'setup-compilation)
