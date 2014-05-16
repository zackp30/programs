#lang web-server/insta

(struct post (title body))


(define BLOG (list (post "Stuff!"
                         "And things!")))


(define (render-greeting a-name)
  (response/xexpr
    '(html (head (title "Ohey"))
           (body (p ,(string-append "Hello " a-name))))))


(define (render-as-itemized-list fragments)
  '(ul ,@(map render-as-item fragments)))

(define (render-as-item a-fragment)
  '(li ,a-fragment))

(define (render-blog-page a-blog request)
  (response/xexpr
    '(html (head (title "Blog."))
           (body (h1 "Welcome!")
                 ,(render-posts a-blog)))))


; Renders list of posts.
(define (render-posts a-blog)
  '(div class="post" ,(post-title a-blog)
        (p ,@(map post-body a-blog))))


(define (parse-post bindings)
  ('title bindings
   'body bindings))




; Core controller.
(define (start request)
  (local [(define a-blog (cond [(can-parse-post? (request-bindings request))
                                (cons (parse-post (request-bindings request))
                                      BLOG)]
                               [else
                                 BLOG]))]
         (render-blog-page a-blog request)))




(define (can-parse-post? bindings)
  (and (exists-binding? 'title bindings)
       (exists-binding? 'body bindings)))



