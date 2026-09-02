No `USER` in the Dockerfile. Add a user, hand it `/app/data`, switch to it:
    RUN adduser -D -u 10001 app && chown -R app /app
    USER app
    docker build -t wg-api:1.0 . && docker rm -f wg-api && docker run -d --name wg-api wg-api:1.0
