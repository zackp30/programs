(ns hello_world.views.index
  (:use [hiccup core page]))


(defn index []
  (html5
    [:head
     [:title "Welcome!"]
     [:script {:type "text/javascript" :src "resources/js/js"}]]
    [:body
     [:h1 "Welcome! You've somehow managed to find this Clojure powered website!"]
     [:h1 "Have a nice time here!"]]))
