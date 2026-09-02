Redis writes to `/data`; the volume is mounted at `/var/lib/redis` → data lives in the container layer and dies with it.
    sed -i '' 's#/var/lib/redis#/data#' ~/.k8s-wargame/docker/14-volume-lost/compose.yaml && docker compose -f ~/.k8s-wargame/docker/14-volume-lost/compose.yaml up -d
