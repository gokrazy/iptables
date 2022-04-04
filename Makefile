_gokrazy/extrafiles/usr/lib/aarch64-linux-gnu/iptables: Dockerfile
	docker build --rm -t iptables .
	docker run --rm -v $$(pwd)/_gokrazy/extrafiles:/tmp/extrafiles/ iptables sh -c 'mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen && mkdir -p /tmp/extrafiles/lib && mkdir -p /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && tar xf /tmp/freeze/freeze*.tar -C /tmp/extrafiles/usr/lib/aarch64-linux-gnu/iptables.frozen --strip-components=1 && cp -r /usr/lib/aarch64-linux-gnu/xtables /tmp/extrafiles/usr/lib/aarch64-linux-gnu/ && chown -R 1000.1000 /tmp/extrafiles'

clean:
	rm -rf _gokrazy/extrafiles
