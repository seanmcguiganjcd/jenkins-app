package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "gonks is the best! Your Go application has been successfully deployed to dev on Kubernetes.")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":3000", nil)
}
