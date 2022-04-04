## iptables for gokrazy

This package is a [frozen](https://github.com/gokrazy/freeze) version of
`iptables`, coming from [Debian
“bookworm” (currently testing)](https://www.debian.org/releases/bookworm/).

This package was originally introduced to make containers work on gokrazy,
e.g. using podman, and will be updated when needed.

## Architecture support

Currently `GOARCH=arm64` only (multiarch tuple `aarch64-linux-gnu`).

Please use the tuples from https://wiki.debian.org/Multiarch/Tuples when adding
support for more architectures.
