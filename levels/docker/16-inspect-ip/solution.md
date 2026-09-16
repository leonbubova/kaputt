    docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web > ~/.k8s-wargame/docker/16-inspect-ip/ip.txt
