package main

import (
	"net/http"
	"regexp"
)

func main() {
	fileServer()
}

func fileServer() {
	fileServer := http.FileServer(http.Dir("/static"))
	fileMatcher := regexp.MustCompile(`\.[a-zA-Z]*$`)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if !fileMatcher.MatchString(r.URL.Path) {
			http.ServeFile(w, r, "/static/index.html")
		} else {
			fileServer.ServeHTTP(w, r)
		}
	})
	http.ListenAndServe(":80", nil)
}
