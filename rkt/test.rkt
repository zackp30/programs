#lang racket
(define a 1)
(if (not (> 2 a))
  (display "Ohey!")
  (display "Dammit."))
