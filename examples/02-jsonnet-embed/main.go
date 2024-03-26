package main

import (
	"fmt"
	"log"
	"os"

	jsonnet "github.com/google/go-jsonnet"
)

func main() {
	f := os.Args[1]
	vm := jsonnet.MakeVM()
	jsonStr, err := vm.EvaluateFile(f)
	if err != nil {
		log.Fatalf("Failed to evaluate Jsonnet: err: %v", err)
	}
	fmt.Println(jsonStr)
}
