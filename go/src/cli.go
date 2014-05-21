package main

import (
	"fmt"

	"github.com/docopt/docopt-go"
)

func main() {
	usage := `Test.
  Usage:
  cli [--things=<n>] 
  `
	arguments, _ := docopt.Parse(usage, nil, true, "Test", false)
	fmt.Println(arguments)
	for s := 0; s < arguments["--things"]; s++ {
		fmt.Println(s)
	}
}
