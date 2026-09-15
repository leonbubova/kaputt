## 1
A container only gets the environment you hand it at `docker run` — nothing from your laptop's shell comes along. An app that dies on boot usually says which variable it wanted: `docker ps -a` for the exit code, then `docker logs wg-api`.
## 2
Compare with what the container got: `docker inspect wg-api --format '{{.Config.Env}}'`. Spelling.
## 3
`docker rm -f wg-api && docker run -d --name wg-api -e API_TOKEN=s3cret-token -e LOG_LEVEL=info wg-api:1.0`
