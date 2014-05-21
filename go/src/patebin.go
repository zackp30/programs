package main

import (
  r "github.com/dancannon/gorethink"
)

var session *r.session

session, err := r.Connect(map[string]interface{}{
  "address": "localhost:28015",
  "database": "paste",
  "authkey": "dfjiosjdiosjiodhfbhiu dh uyi9 u8998uy89 er",
})

if err != nil {
  log.Fatalln(err.Error())
}

