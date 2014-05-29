package main

import (
	"fmt"
	"net"

	"github.com/Sirupsen/logrus"
)

var log = logrus.New()

func handle(client net.Conn, server net.Listener) {
}

func main() {
	server, err := net.Listen("tcp", ":7890")
	if err != nil {
		fmt.Println("it dun goofed", err.Error())
	}
	log.Info("Server started.")
	for {
		client, _ := server.Accept()
		log.Infof("Host %s connected.", client.RemoteAddr().String())
		go handle(client, server)
	}
}
