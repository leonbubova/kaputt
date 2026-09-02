Logs: `FATAL: API_TOKEN is not set`. The container was started with `API_TOKN`.
    docker rm -f wg-api && docker run -d --name wg-api -e API_TOKEN=s3cret-token wg-api:1.0
