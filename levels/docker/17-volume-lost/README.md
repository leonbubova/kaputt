# cache loses everything on redeploy
"Every `docker compose down && docker compose up -d` of the cache stack (`~/.k8s-wargame/docker/17-volume-lost/`) wipes all redis keys, although we declared a volume."
Goal: a key written with `docker exec wg-cache redis-cli set k v` + `redis-cli save` survives `down`/`up -d`. Keep image `redis:7-alpine`.
