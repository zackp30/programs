#lang racket
(require
  (except-in 2htdp/image color?)
  file/gif
  )

(define ohey (open-output-file
               (string->path "/home/morpheus/gitlab/tex/texdocuments/pls.gif")
               #:mode 'binary #:exists 'replace
               ))
(define colours '(green yellow red orange green yellow red orange yellow green yellow blue blue blue))
(define gif-stream-thing (gif-start ohey 100 100 65 #f))
(define stuff #"ohey")
(define stuff2 (image->color-list
                 (apply overlay
                        (for/list ([i (in-range 1 200)])
                                  (circle i 'outline (list-ref colours (random (length colours)))))
                        )))
(gif-add-image gif-stream-thing 100 100 100 100 #t stuff2 stuff)
;(string->path "/home/morpheus/gitlab/tex/texdocuments/ohey.svg")
