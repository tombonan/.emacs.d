;;; dotenv-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "dotenv-mode" "dotenv-mode.el" (0 0 0 0))
;;; Generated autoloads from dotenv-mode.el

(autoload 'dotenv-mode "dotenv-mode" "\
Major mode for `.env' files.

\(fn)" t nil)

(mapc (lambda (s) (add-to-list 'auto-mode-alist `(,s . dotenv-mode))) '("\\.env\\'" "\\.env\\.example\\'"))

(register-definition-prefixes "dotenv-mode" '("dotenv-"))

;;;***

;;;### (autoloads nil nil ("dotenv-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dotenv-mode-autoloads.el ends here
