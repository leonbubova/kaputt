## 1
Compose has to pull every service's image before it can start it — an `image:tag` that doesn't exist in the registry fails that one service, the others come up fine. Run `docker compose up -d` yourself in the work dir and read the error — it names the thing it could not get.
## 2
"manifest unknown" / "not found" = that image:tag doesn't exist in the registry. Compare with `docker images | grep redis`.
## 3
Fix the tag in `compose.yaml` (`redis:7-alpine`), then `docker compose up -d`.
