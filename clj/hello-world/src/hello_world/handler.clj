(ns hello-world.handler
  (:use 
    compojure.core
    hello_world.views.index
    hiccup.core
    )
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] (index))
  (route/resources "/")
  (route/not-found "Not Found"))

(def app
  (handler/site app-routes))
