all: _gokrazy/extrafiles_arm64.tar _gokrazy/extrafiles_amd64.tar

_gokrazy/extrafiles_arm64.tar: Dockerfile
	docker build --rm -t iptables .
	docker run --rm -v $$(pwd)/_gokrazy/:/tmp/gokrazy/ iptables sh -c 'mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen && mkdir -p /tmp/extrafiles/lib && mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && tar xf /tmp/freeze/freeze*.tar -C /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen --strip-components=1 && cp -r /usr/lib/aarch64-linux-gnu/xtables /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && chown -R 1000.1000 /tmp/extrafiles && cd /tmp/extrafiles && tar cf /tmp/gokrazy/extrafiles_arm64.tar *'

_gokrazy/extrafiles_amd64.tar: Dockerfile.amd64
	docker build --rm -t iptables --file Dockerfile.amd64 .
	docker run --rm -v $$(pwd)/_gokrazy/:/tmp/gokrazy/ iptables sh -c 'mkdir -p /tmp/extrafiles/usr/lib/x86_64-linux-gnu/iptables.frozen && mkdir -p /tmp/extrafiles/lib && mkdir -p /tmp/extrafiles/usr/lib/x86_64-linux-gnu/ && tar xf /tmp/freeze/freeze*.tar -C /tmp/extrafiles/usr/lib/x86_64-linux-gnu/iptables.frozen --strip-components=1 && cp -r /usr/lib/x86_64-linux-gnu/xtables /tmp/extrafiles/usr/lib/x86_64-linux-gnu/ && chown -R 1000.1000 /tmp/extrafiles && cd /tmp/extrafiles && tar cf /tmp/gokrazy/extrafiles_amd64.tar *'

clean:
	rm -f _gokrazy/extrafiles_*.tar
