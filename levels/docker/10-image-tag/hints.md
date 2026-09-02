## 1
Run `docker compose up -d` yourself in the work dir and read the error — it names the thing it could not get.
## 2
"manifest unknown" / "not found" = that image:tag doesn't exist in the registry. Compare with `docker images | grep redis`.
## 3
Fix the tag in `compose.yaml` (`redis:7-alpine`), then `docker compose up -d`.
