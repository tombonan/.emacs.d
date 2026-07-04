;; Kubernetes config

;; Use the kubernetes package and change default polling
;;
;; https://kubernetes-el.github.io/kubernetes-el/
(use-package kubernetes
  :straight t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(provide 'setup-kubernetes)
