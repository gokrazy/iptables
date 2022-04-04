package main

import (
	"fmt"
	"os"
	"os/exec"
	"syscall"
)

func main() {
	const frozenDir = "/usr/lib/aarch64-linux-gnu/iptables.frozen"
	iptables := exec.Command(
		frozenDir+"/ld-linux-aarch64.so.1",
		append([]string{
			frozenDir + "/iptables",
		}, os.Args[1:]...)...)
	iptables.Env = append(os.Environ(), "LD_LIBRARY_PATH="+frozenDir)
	iptables.Stdin = os.Stdin
	iptables.Stdout = os.Stdout
	iptables.Stderr = os.Stderr
	err := iptables.Run()
	if err != nil {
		if exiterr, ok := err.(*exec.ExitError); ok {
			if status, ok := exiterr.Sys().(syscall.WaitStatus); ok {
				os.Exit(status.ExitStatus())
			}
		} else {
			fmt.Fprintf(os.Stderr, "%v: %v\n", iptables.Args, err)
		}
	}
}
