package main

import (
	"io/ioutil"
	"log"
	"os"
	"strconv"

	"github.com/xpensia/sshgate"
)

type GitApp struct {
	sshgate.BaseApp
}

func main() {
	pem, err := ioutil.ReadFile("id_rsa")
	server, err := sshgate.NewServer(pem, Authenticate)
	if err != nil {
		log.Panicf("Damn, the private key didn't load, gj.", err)
	}
	port, err := strconv.Atoi(os.Getenv("PORT"))
	if err != nil {
		log.Panic(err)
	}
	server.Listen("", port)
}

func (a GitApp) CanExec(cmd string, args []string, env map[string]string) bool {
  log.Println("EXEC ", cmd, args)
  return cmd == "git"
}

func Authenticate(c sshgate.Connection, user, algo string, pubkey []byte) (bool, sshgate.App) {
	if user == "git" {
		log.Printf("User logged in", algo)
		return true, GitApp{}
	} else {
		return false, nil
	}
}
