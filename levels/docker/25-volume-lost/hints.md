## 1
A volume only persists what's written *inside* its mount point — the rest of the container filesystem goes with the container. So: does redis write its dump where the volume is mounted? `docker exec wg-cache redis-cli config get dir` shows the dir, and `docker logs wg-cache` mentions the file on save.
## 2
Compare with the mount: `docker inspect wg-cache --format '{{json .Mounts}}'`. If the mount point isn't the dir redis writes to, the volume holds nothing useful.
## 3
Mount the volume at `/data` in `compose.yaml`, then `docker compose up -d`.
