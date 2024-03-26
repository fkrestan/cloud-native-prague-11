package main

import (
	"fmt"
	"log"
	"os"
	"math/rand"

	"github.com/google/go-jsonnet"
	"github.com/google/go-jsonnet/ast"
)

func main() {
	nativeRandom := &jsonnet.NativeFunction{
		Name:   "random",
		Params: ast.Identifiers{},
		Func: func([]interface{}) (interface{}, error) {
			return rand.Float64(), nil
		},
	}

	f := os.Args[1]
	vm := jsonnet.MakeVM()
	vm.NativeFunction(nativeRandom)
	result, err := vm.EvaluateFile(f)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(result)
}
