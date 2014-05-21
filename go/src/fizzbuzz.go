package main

import (
	"fmt"
)

func main() {
	var buzzer = ""
	for i := 0; i < 100; i++ {
		if i%5 == 0 {
			buzzer += "fizz"
		}
		if i%2 == 0 {
			buzzer += "buzz"
		}
		fmt.Println(i, buzzer)
		buzzer = ""
	}
}
