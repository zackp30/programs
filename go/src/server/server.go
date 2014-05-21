package main

import (
	"net/http"

	"fmt"

	"github.com/go-martini/martini"
	"github.com/martini-contrib/auth"
	"github.com/yosssi/gold"
)

var g = gold.NewGenerator(false)

func handle(r http.ResponseWriter, req *http.Request, route string) {
	tmpl, err := g.ParseFile("./" + route + ".gold")
	if err != nil {
		fmt.Println(err.Error())
	}
	data := map[string]interface{}{"Title": "Gold"}
	err = tmpl.Execute(r, data)
}
func main() {
	m := martini.Classic()
	m.Use(auth.Basic("stuff", "andthings"))
	m.Get("/", func(r http.ResponseWriter, req *http.Request) {
		handle(r, req, "index")
	})
	m.Get("/stuff", func(r http.ResponseWriter, req *http.Request) {
		handle(r, req, "stuff")
	})
	m.NotFound(func(r http.ResponseWriter, req *http.Request) {
		handle(r, req, "404")
	})
	http.ListenAndServe(":9056", m)
}
