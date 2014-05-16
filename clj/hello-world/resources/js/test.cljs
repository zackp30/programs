(ns hello-world.js.test)
(defn ^:export greet [n]
  (str "Hello " n))

(greet "stuff")
