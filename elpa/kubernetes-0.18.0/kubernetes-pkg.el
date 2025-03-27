;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "kubernetes" "0.18.0"
  "Magit-like porcelain for Kubernetes."
  '((emacs         "25.1")
    (dash          "2.12.0")
    (magit-section "3.1.1")
    (magit-popup   "2.13.0")
    (with-editor   "3.0.4")
    (request       "0.3.2")
    (s             "1.12.0")
    (transient     "0.3.0"))
  :url "https://github.com/kubernetes-el/kubernetes-el"
  :commit "b155d64aa72bd1175770db3518a67a347caa36dd"
  :revdesc "b155d64aa72b"
  :keywords '("kubernetes")
  :authors '(("Chris Barrett" . "chris+emacs@walrus.cool"))
  :maintainers '(("Chris Barrett" . "chris+emacs@walrus.cool")
                 ("Noorul Islam K M" . "noorul@noorul.com")
                 ("Jonathan Jin" . "me@jonathanj.in")))
