#lang racket
(require 2htdp/image)
(define colours '(green yellow red orange pink))
(define toggle #t)

(define le-toggle
  (if dat-toggle-tho
    #f
    #t
    ))

(define dat-toggle-tho
  (if le-toggle
    #t
    #f
    ))


(for/list [(in-range 20)]
          (displayln le-toggle)
          )
