#lang racket
(require (planet dmac/spin))
(get "/"
     (lambda () "Ohey"))
(run
  #:listen-ip "0.0.0.0"
)
