## 1
Without a `USER` instruction, containers run as root. `docker exec wg-api id`.
## 2
Add `RUN adduser -D -u 10001 app` and `USER app` to the Dockerfile. Rebuild, recreate — then read `docker logs wg-api`: the app wants to write somewhere.
## 3
The new user can't write `/app/data` (created by root). Add `chown -R app /app` before `USER app`. Then `docker build -t wg-api:1.0 . && docker rm -f wg-api && docker run -d --name wg-api wg-api:1.0`.
