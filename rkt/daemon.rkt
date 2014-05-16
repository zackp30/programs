#lang racket

(require racket/tcp)
(define server (tcp-listen 7890))
(define-values (s-in s-out) (tcp-accept server))

(let loop ()
  (cond
    [(eq? "ohey" (read-line s-in)) (display "ohai there" s-out)]
    [(eq? "stuff" (read-line s-in)) (display "ohey" s-out)]
    [else (display " " s-out)])
  (loop))


(displayln (read-line s-in))

(close-output-port server)
