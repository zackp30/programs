package main

import (
	"fmt"
	"net"

	"github.com/Sirupsen/logrus"
)

var log = logrus.New()
var passwordstr = "stuff"

func prompt(client net.Conn, server net.Listener) {
	var cmd string
	for {
		fmt.Fprintln(client, ">>> ")
		fmt.Fscan(client, &cmd)
		if cmd == "stuff" {
			fmt.Fprintln(client, "And things!")
		} else if cmd == "exit" {
			client.Close()
			break
		}
	}
}

func password(client net.Conn, server net.Listener) bool {
	var entered string
	var i int

	for {
		fmt.Fprint(client, "PASSWORD")
		fmt.Fscan(client, &entered)
		i = i + 1

		if entered != passwordstr {
			log.Warnf("Host %s failed password (%s) (%s)", client.RemoteAddr(), string(i), entered)
			if i > 2 {
				return false
			}
		} else {
			return true
		}
	}

}

func handle(client net.Conn, server net.Listener) {
	log.Infof("Client %s connected.", client.RemoteAddr())
	if password(client, server) {
		go prompt(client, server)

	} else {
		fmt.Fprintln(client, "Too many auth attempts, disconnecting.")
		client.Close()
	}
}

func main() {
	server, err := net.Listen("tcp", ":7890")
	if err != nil {
		log.Fatal("Could not listen on port 7890 exiting.")
	}

	for {
		client, _ := server.Accept()

		go handle(client, server)

	}

}
