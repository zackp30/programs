package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	rand.Seed(time.Now().UTC().UnixNano())
	for i := 0; i < 10; i++ {
		if i == rand.Intn(10) {
			fmt.Println(i, "no gopher for you :(")
		} else {
			fmt.Println(i, "gophers to you!")
		}
	}
}
