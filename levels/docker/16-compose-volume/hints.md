## 1
Like networks, compose declares named volumes in a top-level `volumes:` block and mounts them per service with `volumes: ["<name>:<path>"]` — the same `name:path` pair as `-v` on `docker run`.
## 2
```
services:
  notes:
    volumes: ["notes:/notes"]
volumes:
  notes: {name: wg-notes}
```
Without `name:` compose would call it `wg_notes`.
## 3
`docker compose up -d` in the work dir, then `docker inspect --format '{{json .Mounts}}' wg-notes` to see the mount. `down` removes containers but keeps volumes (unless you pass `-v`).
