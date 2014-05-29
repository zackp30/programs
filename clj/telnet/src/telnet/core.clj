(ns telnet.core
  (:gen-class))


(use 'lamina.core 'aleph.tcp)
(defn cmd
  "Handle commands."
  [arg channel]
  (cond 
    (= arg "ohey") "hello."
    :else nil))



(defn start-server 
  "Start listening on specified port."
  [port]
  (start-tcp-server cmd {:port port}))


(defn -main
  "Call stuff."
  [& args]
  (start-server 7890))

