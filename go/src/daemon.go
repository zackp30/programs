// Go echo server.
// Copyright 2014 Zack Piper - all rights reserved - you may not redistribute this under any circumstances - use of this program in commercial industry is prohibited.
package main

import (
	"fmt"
	"io"
	"io/ioutil"
	"net"
	"os"
	"time"

	"github.com/Sirupsen/logrus"
	"github.com/codegangsta/cli"
)

var log = logrus.New()

func exit(conn net.Conn) {
	conn.Close()
}

func announce_cmd(cmd string, conn net.Conn) {
	log.Info(cmd, "/!\\", conn.RemoteAddr().String())
}

func cmd(stuff io.Writer, stuffr io.Reader, conn net.Conn) {
	var cmd string
	for {
		fmt.Fprint(stuff, ">>> ")
		fmt.Fscan(stuffr, &cmd)
		if conn != nil {
			if cmd == "stuff" {
				fmt.Fprintln(stuff, "And things!")
				announce_cmd(cmd, conn)
			} else if cmd == "things" {
				fmt.Fprintln(stuff, "And stuff!")
				announce_cmd(cmd, conn)
			} else if cmd == "time" {
				fmt.Fprintln(stuff, time.Now().Unix())
				announce_cmd(cmd, conn)
			} else if cmd == "exit" {
				log.Warn("Host disconnected: ", conn.RemoteAddr().String())
				announce_cmd(cmd, conn)
				exit(conn)
				cmd = "" // Reset command variable, otherwise loop occurs. // Still occurs with certain characters...
			} else if cmd == "" {
				return
			} else {
				fmt.Fprintln(stuff, string(cmd))
			}
		}
	}
}
func handle(stuff io.Writer, stuffr io.Reader, conn net.Conn) {
	cmd(stuff, stuffr, conn)
}

func server() {
	ln, err := net.Listen("tcp", ":7890")
	log.Info("Server started - running on 7890.")

	if err != nil {
		fmt.Println("Derp", err.Error())
	}

	for {
		conn, err := ln.Accept()
		log.Info("Host connected:", conn.RemoteAddr().String())
		if err != nil {
			continue
		}
		file, ferr := ioutil.ReadFile("motd.txt")
		if ferr != nil {
			return
		}
		fmt.Fprintln(conn, string(file))
		go handle(conn, conn, conn)
	}
}

func main() {
	log.Info("Starting server.")
	// app := cli.NewApp().Run(os.Args)
	app := cli.NewApp()
	app.Name = "Stuff!"
	app.Commands = []cli.Command{
		{
			Name:      "start",
			ShortName: "start",
			Usage:     "Starts server.",
			Flags: []cli.Flag{
				cli.BoolFlag{"d", "Go into daemon mode."},
			},
			Action: func(c *cli.Context) {
				if c.Bool("d") == true {
					server()
				} else {
					server()
				}
			},
		},
	}
	app.Run(os.Args)
}
