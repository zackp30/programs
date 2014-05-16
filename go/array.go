// Help given from http://www.golang-book.com/13
package main

import (
	"container/list"
	"fmt"
)

func main() {
	var list list.List       // Initialize the list.
	list.PushBack("This is") // add items to list.
	list.PushBack("a computer program")
	list.PushBack("that prints on several lines.")
	for i := list.Front(); i != nil; i = i.Next() { // iterate over list, printing out contents of said list.
		fmt.Println(i.Value)
	}

}
