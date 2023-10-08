package routes

import (
	"crud/controllers"
	"crud/middleware"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func HandleRequest() {
	request := mux.NewRouter()
	request.Use(middleware.ContentType)
	request.HandleFunc("/", controllers.Home)
	request.HandleFunc("/personalidades", controllers.ListarPersonalidades).Methods("Get")
	request.HandleFunc("/personalidades/{id}", controllers.ListarPersonalidadePorId).Methods("Get")
	request.HandleFunc("/personalidades", controllers.CriarPersonalidade).Methods("Post")
	request.HandleFunc("/personalidades/{id}", controllers.DeletarPersonalidade).Methods("Delete")
	request.HandleFunc("/personalidades/{id}", controllers.EditarPersonalidade).Methods("Put")
	log.Fatal(http.ListenAndServe(":8000", request))
}
