package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	log.Println("Hola")
	router := mux.NewRouter()

	router.HandleFunc("/getpost", getPosts).Methods("GET")
	http.ListenAndServe(":8000", router)
}

func getPosts(w http.ResponseWriter, r *http.Request) {
	log.Println("HOLA POST")
}
