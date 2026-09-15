Published `18009:8080`, nginx listens on 80 → nothing accepts the forwarded connection.
    docker rm -f wg-web && docker run -d --name wg-web -p 18009:80 nginx:1.27-alpine
