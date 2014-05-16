(ns test.core
  (:require [irclj.core :as irc])
  (:gen-class))

(defn init-bot
  "Initializes bot."
  [name password server]
  (irc/create-irc name password server))
(defn -main
  "Initializes connection."
  [& args]
  (init-bot "stuff" "Stuff" nil "irc.apertron.net")
  )
