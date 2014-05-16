package main

import (
	"bufio"    // Provides advanced file reading capabilitiues.
	"fmt"      // println, scanf, etc.
	"log"      // Logger.
	"net/http" // HTTP
	"os"       // Only used it for os.Open() :(
	"regexp"
	"strings" // String manipulation.

	"github.com/Sirupsen/logrus" // Logging.
	"github.com/elazarl/goproxy" // Core proxy component.
)

func urls(url string) string {
	var to_return string
	urlFile, err := os.Open("./urls.txt")
	if err != nil {
		log.Fatal(err.Error())
	}
	scanner := bufio.NewScanner(urlFile)
	var lines []string
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	for line := range lines {
		if strings.Split(lines[line], ",")[0] == url {
			// to_return = strings.Split(lines[line], ",")[0]
			to_return = string(lines[line])
		} else {
			to_return = "CODE001"
		}
	}

	fmt.Println(to_return)
	return to_return
}
func main() {
	proxy := goproxy.NewProxyHttpServer()
	proxy.Verbose = true
	log := logrus.New()
	regexp, err := regexp.Compile(".*")
	if err != nil {
		os.Exit(1)
	}
	// proxy.OnRequest(goproxy.UrlMatches(regexp)).DoFunc(
	// 	func(r *http.Request, ctx *goproxy.ProxyCtx) (*http.Request, *http.Response) {
	// 		r.SetBasicAuth("stuff", "timmy123")
	// 		return r, goproxy.NewResponse(r,
	// 			// goproxy.ContentTypeText, http.StatusForbidden,
	// 			http.Redirect(http.ResponseWriter, urls(string(r.URL.Host)), 403),
	// 			"...")
	// 	})
	proxy.OnRequest(goproxy.UrlMatches(regexp)).DoFunc(
		func(r *http.Request, ctx *goproxy.ProxyCtx) (*http.Request, *http.Response) {
			return r, goproxy.NewResponse(r,
				http.Redirect(goproxy., urls(string(r.URL.host)), 403),
				"...")
		})
	log.Info(http.ListenAndServe(":9078", proxy))
}
