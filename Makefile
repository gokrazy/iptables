_gokrazy/extrafiles.tar: Dockerfile
	docker build --rm -t iptables .
	docker run --rm -v $$(pwd)/_gokrazy/:/tmp/gokrazy/ iptables sh -c 'mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen && mkdir -p /tmp/extrafiles/lib && mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && tar xf /tmp/freeze/freeze*.tar -C /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen --strip-components=1 && cp -r /usr/lib/aarch64-linux-gnu/xtables /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && chown -R 1000.1000 /tmp/extrafiles && cd /tmp/extrafiles && tar cf /tmp/gokrazy/extrafiles.tar *'

clean:
	rm -f _gokrazy/extrafiles.tar
