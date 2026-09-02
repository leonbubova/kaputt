## 1
Where does redis actually write its dump? `docker exec wg-cache redis-cli config get dir`, and `docker logs wg-cache` mentions the file on save.
## 2
Compare with the mount: `docker inspect wg-cache --format '{{json .Mounts}}'`. A volume only persists what's *inside* its mount point.
## 3
Mount the volume at `/data` in `compose.yaml`, then `docker compose up -d`.
