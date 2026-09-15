# machine-applied solutions, one function per level — used by run-all.sh only
W=$HOME/.k8s-wargame/docker
s01(){ docker run -d --name wg-web -p 127.0.0.1:18001:80 nginx:1.27-alpine; }
s02(){ docker run -d --name wg-app -e REGION=eu-central alpine:3.20 sleep infinity; }
s03(){ printf 'FROM nginx:1.27-alpine\nCOPY index.html /usr/share/nginx/html/index.html\n' > "$W/03-build-image/Dockerfile"; docker build -t wg-site:1 "$W/03-build-image"; }
s04(){ docker run -d --name wg-web -p 127.0.0.1:18004:80 -v "$W/04-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s05(){ docker volume create wg-notes; docker run -d --name wg-notes -v wg-notes:/notes alpine:3.20 sleep infinity; docker exec wg-notes sh -c 'echo "keep me" > /notes/hello.txt'; }
s06(){ docker network create wg-net; docker run -d --name wg-b --network wg-net nginx:1.27-alpine; docker run -d --name wg-a --network wg-net busybox:1.36 sleep infinity; }
s07(){ printf 'services:\n  web: {image: nginx:1.27-alpine, container_name: wg-web, ports: ["127.0.0.1:18007:80"]}\n  cache: {image: redis:7-alpine, container_name: wg-cache}\n' > "$W/07-compose/compose.yaml"; docker compose -p wg -f "$W/07-compose/compose.yaml" up -d; }
s08(){ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web > "$W/08-inspect-ip/ip.txt"; }
s09(){ docker rm -f wg-worker; docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; exec sleep infinity'; }
s10(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18009:80 nginx:1.27-alpine; }
s11(){ sed -i '' 's/7-alpne/7-alpine/' "$W/11-image-tag/compose.yaml"; docker compose -f "$W/11-image-tag/compose.yaml" up -d; }
s12(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18011:80 -v "$W/12-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s13(){ docker rm -f wg-api; docker run -d --name wg-api -e API_TOKEN=s3cret-token -e LOG_LEVEL=info wg-api:1.0; }
s14(){ printf 'name: wg\nservices:\n  web: {image: nginx:1.27-alpine, container_name: wg-web, networks: [back]}\n  app: {image: busybox:1.36, container_name: wg-app, command: sleep infinity, networks: [back]}\nnetworks:\n  back: {name: wg-back}\n' > "$W/14-compose-network/compose.yaml"; docker compose -f "$W/14-compose-network/compose.yaml" up -d; }
s15(){ sed -i '' 's/networks: \[back\]/networks: [back, front]/' "$W/15-networks/compose.yaml"; docker compose -f "$W/15-networks/compose.yaml" up -d; }
s16(){ printf 'name: wg\nservices:\n  notes: {image: alpine:3.20, container_name: wg-notes, command: sleep infinity, volumes: ["notes:/notes"]}\nvolumes:\n  notes: {name: wg-notes}\n' > "$W/16-compose-volume/compose.yaml"; docker compose -f "$W/16-compose-volume/compose.yaml" up -d; }
s17(){ sed -i '' 's#/var/lib/redis#/data#' "$W/17-volume-lost/compose.yaml"; docker compose -f "$W/17-volume-lost/compose.yaml" up -d; }
s18(){ sed -i '' 's/entrypiont/entrypoint/' "$W/18-build-fails/Dockerfile"; docker build -t wg-tool:1.0 "$W/18-build-fails"; }
s19(){ echo ".cache/" > "$W/19-image-bloat/.dockerignore"; docker build -t wg-app:1.0 "$W/19-image-bloat"; }
s20(){ printf 'name: wg\nservices:\n  web:\n    image: nginx:1.27-alpine\n    container_name: wg-web\n    healthcheck: {test: ["CMD", "wget", "-qO-", "http://localhost/"], interval: 2s, timeout: 2s, retries: 3}\n' > "$W/20-add-healthcheck/compose.yaml"; docker compose -f "$W/20-add-healthcheck/compose.yaml" up -d; }
s21(){ sed -i '' 's/"-p", "6380", //' "$W/21-healthcheck/compose.yaml"; docker compose -f "$W/21-healthcheck/compose.yaml" up -d; }
s22(){ docker update --restart=unless-stopped wg-worker; docker start wg-worker; }
s23(){ awk '/^CMD/{print "RUN adduser -D -u 10001 app"; print "USER app"} {print}' "$W/23-non-root-image/Dockerfile" > "$W/23-non-root-image/Dockerfile.new" && mv "$W/23-non-root-image/Dockerfile.new" "$W/23-non-root-image/Dockerfile"; docker build -t wg-tool:2 "$W/23-non-root-image"; }
s24(){ awk '/^CMD/{print "RUN adduser -D -u 10001 app && chown -R app /app"; print "USER app"} {print}' "$W/24-runs-as-root/Dockerfile" > "$W/24-runs-as-root/Dockerfile.new" && mv "$W/24-runs-as-root/Dockerfile.new" "$W/24-runs-as-root/Dockerfile"
  docker build -t wg-api:1.0 "$W/24-runs-as-root" && docker rm -f wg-api && docker run -d --name wg-api wg-api:1.0; }
s25(){ docker logs wg-web 2>&1 | grep 'GET /checkout' | grep ' 404 ' | grep -o 'rid=.*' | cut -d= -f2- > "$W/25-find-request/answer.txt"; }
s26(){ docker rm $(docker ps -aq -f 'name=^wg-old-'); docker volume rm $(docker volume ls -q -f 'name=^wg-old-'); docker image prune -f; }
s27(){ docker update --memory=128m --memory-swap=128m wg-report && docker start wg-report; }
