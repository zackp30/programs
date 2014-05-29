#lang racket


(define server (tcp-listen 7890))

(define (write-flush port stuff)
  (begin
    (flush-output port)
    (display stuff port)
    (flush-output port)))




(let loop ()
  (define-values  (in out) (tcp-accept server))
  (thread (lambda ()
            (let inner-loop ()
              (flush-output out)
              (displayln (read-line in))
              (cond 
                [(eq? (read-line in) "ohey") (write-flush "stuff" out)])
              (flush-output)
              (flush-output out)
              (inner-loop))))
  (loop))

(close-output-port server)




; (define server (tcp-listen 7893))
;
; (let loop ()
;   (define-values (in out) (tcp-accept server))
;   (thread (lambda ()
;             (let inner-loop ()
;               (flush-output out)
;               (display (read-line in))
;               (flush-output)
;               (flush-output out)
;               (inner-loop))))
;   (loop))
;
; (close-output-port server)
;
