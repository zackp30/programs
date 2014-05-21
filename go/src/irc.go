package main

import "flag"
import irc "github.com/fluffle/goirc/client"
import "fmt"

func main() {
	flag.Parse() // parses the logging flags.
	c := irc.SimpleClient("nick")
	// Optionally, enable SSL
	c.SSL = true

	// Add handlers to do things here!
	// e.g. join a channel on connect.
	c.AddHandler(irc.CONNECTED,
		func(conn *irc.Conn, line *irc.Line) { conn.Join("#channel") })
	// And a signal on disconnect
	quit := make(chan bool)
	c.AddHandler(irc.DISCONNECTED,
		func(conn *irc.Conn, line *irc.Line) { quit <- true })

	// Tell client to connect
	if err := c.Connect("irc.freenode.net"); err != nil {
		fmt.Printf("Connection error: %s\n", err.String())
	}

	// Wait for disconnect
	<-quit
}
