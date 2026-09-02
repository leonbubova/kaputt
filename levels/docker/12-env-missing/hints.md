## 1
`docker ps -a` → exit code. Then `docker logs wg-api` — the app tells you what it's missing.
## 2
Compare with what the container got: `docker inspect wg-api --format '{{.Config.Env}}'`. Spelling.
## 3
`docker rm -f wg-api && docker run -d --name wg-api -e API_TOKEN=s3cret-token -e LOG_LEVEL=info wg-api:1.0`
