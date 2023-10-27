package main

import (
	"crud/database"
	"crud/routes"
	"fmt"
)

func main() {
	database.ConectarBanco()
	fmt.Println("Server is on")
	routes.HandleRequest()
}
