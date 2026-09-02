# monitoring needs the web container's IP
"The new monitoring agent can't use Docker DNS yet — it wants the plain IP of `wg-web` (nginx, already running) in a file." Goal: write the container's IP address on its Docker network (nothing else, one line) into `~/.k8s-wargame/docker/08-inspect-ip/ip.txt`. Don't restart `wg-web`.
