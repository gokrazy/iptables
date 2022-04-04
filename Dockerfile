FROM debian:bookworm

RUN dpkg --add-architecture arm64

RUN apt-get update && apt-get install -y iptables:arm64 qemu-user-static golang-go ca-certificates

RUN go install github.com/gokrazy/freeze/cmd/...@latest

RUN ~/go/bin/freeze -wrap=qemu-aarch64-static $(which iptables)
