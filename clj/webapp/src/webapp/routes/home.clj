(ns webapp.routes.home
  (:use compojure.core)
  (:require [webapp.views.layout :as layout]
            [webapp.util :as util]))

(defn home-page []
  (layout/render
    "home.html" {:content (util/md->html "/md/home.md")}))

(defn about-page []
  (layout/render "about.html"))

(defn stuff-page []
  (layout/render "stuff.html"))

(defroutes home-routes
  (GET "/" [] (home-page))
  (GET "/about" [] (about-page))
  (GET "/stuff" [] (stuff-page)))

