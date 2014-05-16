#lang racket

(require racket/async-channel)
(require irc)

(define-values (connection ready-event)
  (irc-connect "irc.freenode.net" 6667 "jifjdio" "jidso" "Schuster's Echo Bot"))
(void (sync ready-event))

(irc-join-channel connection "##matrixiumn")
(define incoming (irc-connection-incoming connection))

(let loop ()
  (define message (async-channel-get incoming))
  (match message
         [(irc-message prefix "PRIVMSG" params _)
          (define prefix-match (regexp-match #rx"^[^!]+" prefix))
          (define message-match (regexp-match #rx"jifjdio: (.*)" (second params)))
          (when (and prefix-match message-match)
            (irc-send-message connection "##matrixiumn"
                              (string-append (first prefix-match) ": " (second message-match))))]
         [_ (void)])
  (loop))
