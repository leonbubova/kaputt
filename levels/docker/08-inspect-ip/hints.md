## 1
Everything Docker knows about a container is in `docker inspect wg-web` — a big JSON document. The IP is under `NetworkSettings` → `Networks` → the network name → `IPAddress`.
## 2
`--format` pulls one value out instead of reading the whole document: `docker inspect --format '{{.State.Status}}' wg-web`. Nested fields chain with dots; maps like `Networks` need `range`.
## 3
`docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web > ~/.k8s-wargame/docker/08-inspect-ip/ip.txt`
