;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "restclient-jq" "20220426.1734"
  "Support for setting restclient vars from jq expressions."
  '((restclient "20200502.831")
    (jq-mode    "0.4.1")
    (emacs      "24.4"))
  :url "https://github.com/pashky/restclient.el"
  :commit "ae79e7dd283890072da69b8f48aeec1afd0d9442"
  :revdesc "ae79e7dd2838"
  :keywords '("tools" "comm" "http" "jq")
  :authors '(("Cameron Dorrat" . "cdorrat@gmail.com"))
  :maintainers '(("Cameron Dorrat" . "cdorrat@gmail.com")))
