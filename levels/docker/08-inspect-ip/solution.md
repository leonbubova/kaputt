    docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web > ~/.k8s-wargame/docker/08-inspect-ip/ip.txt
