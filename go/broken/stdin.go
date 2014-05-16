package main

import (
  "fmt"
)



func main() {
  var i string
  _, err := fmt.Scanf("%v", &i)
  if err != nil {
    fmt.Println("Error occured:", err.Error())
  } else {
    var m map[string]string
    m = make(map[string]string)
    m["ohey"] = "stuff"
    for _, stuff := range i {
      fmt.Println(string(stuff))
    }

    fmt.Println(m["ohey"])
  }
}
