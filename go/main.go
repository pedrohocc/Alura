package main

import (
	"crud/database"
	"crud/models"
	"crud/routes"
	"fmt"
)

func main() {
	models.Personalidades = []models.Personalidade{
		{Id: 1, Nome: "Nome1", Historia: "Historia1"},
		{Id: 2, Nome: "Nome2", Historia: "Historia2"},
	}
	database.ConectarBanco()
	fmt.Println("Server is on")
	routes.HandleRequest()
}
