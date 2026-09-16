    docker run -d --name wg-app -e REGION=eu-central alpine:3.20 sleep infinity
    docker exec wg-app printenv REGION
