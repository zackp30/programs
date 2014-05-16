(defn helloworld [user]
 (print "Hello, "(if (= nil user)
        "world!"
        (+ user "!"))))



(helloworld "Zack")
