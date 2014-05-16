#lang racket
(require irc)
(define-values (connection ready)
  (irc-connect "irc.apertron.net" 6667 "pls" "pls" "pls pls"))
(sync ready)
(irc-join-channel connection "#GET_MAD")
(irc-send-message connection "#GET_MAD" "Hello, world!")

;(let loop ([n 1024])
;      (when (positive? n)
;        (displayln n)
;        (loop (quotient n 2))))
