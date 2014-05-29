(use numbers utf8 srfi-1 srfi-13 tcp)

(define server (tcp-listen 7890))

(define-values (i o) (tcp-accept server))
(write-line "ohey" o)
