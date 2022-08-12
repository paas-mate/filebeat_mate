package main

import (
	"filebeat_mate/pkg/fb"
	"filebeat_mate/pkg/util"
	"os"
	"os/signal"
)

func main() {
	util.Logger().Debug("this is a debug msg")
	util.Logger().Info("this is a info msg")
	util.Logger().Error("this is a error msg")
	interrupt := make(chan os.Signal, 1)
	fb.Start()
	signal.Notify(interrupt, os.Interrupt)
	for {
		select {
		case <-interrupt:
			return
		}
	}
}
