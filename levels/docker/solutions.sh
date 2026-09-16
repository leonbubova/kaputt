# machine-applied solutions, one function per level — used by run-all.sh only
W=$HOME/.k8s-wargame/docker
s01(){ docker run --name wg-hello alpine:3.20 echo hello from docker; }
s02(){ docker logs wg-secret > "$W/02-ps-and-logs/word.txt" 2>&1; }
s03(){ docker run -d --name wg-clock alpine:3.20 sleep infinity; }
s04(){ docker rm -f wg-old wg-done; }
s05(){ docker run -d --name wg-page -p 127.0.0.1:18105:80 nginx:1.27-alpine; }
s06(){ docker run -d --name wg-greet -e GREETING=hello alpine:3.20 sleep infinity; }
s07(){ printf 'FROM alpine:3.20\nCOPY hello.txt /hello.txt\nCMD ["cat", "/hello.txt"]\n' > "$W/07-dockerfile/Dockerfile"; docker build -t wg-hello:1 "$W/07-dockerfile"; }
s08(){ docker volume create wg-data; docker run -d --name wg-keeper -v wg-data:/data alpine:3.20 sleep infinity; docker exec wg-keeper sh -c 'echo "still here" > /data/note.txt'; }
s09(){ docker run -d --name wg-web -p 127.0.0.1:18001:80 nginx:1.27-alpine; }
s10(){ docker run -d --name wg-app -e REGION=eu-central alpine:3.20 sleep infinity; }
s11(){ printf 'FROM nginx:1.27-alpine\nCOPY index.html /usr/share/nginx/html/index.html\n' > "$W/11-build-image/Dockerfile"; docker build -t wg-site:1 "$W/11-build-image"; }
s12(){ docker run -d --name wg-web -p 127.0.0.1:18004:80 -v "$W/12-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s13(){ docker volume create wg-notes; docker run -d --name wg-notes -v wg-notes:/notes alpine:3.20 sleep infinity; docker exec wg-notes sh -c 'echo "keep me" > /notes/hello.txt'; }
s14(){ docker network create wg-net; docker run -d --name wg-b --network wg-net nginx:1.27-alpine; docker run -d --name wg-a --network wg-net busybox:1.36 sleep infinity; }
s15(){ printf 'services:\n  web: {image: nginx:1.27-alpine, container_name: wg-web, ports: ["127.0.0.1:18007:80"]}\n  cache: {image: redis:7-alpine, container_name: wg-cache}\n' > "$W/15-compose/compose.yaml"; docker compose -p wg -f "$W/15-compose/compose.yaml" up -d; }
s16(){ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web > "$W/16-inspect-ip/ip.txt"; }
s17(){ docker rm -f wg-worker; docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; exec sleep infinity'; }
s18(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18009:80 nginx:1.27-alpine; }
s19(){ sed -i '' 's/7-alpne/7-alpine/' "$W/19-image-tag/compose.yaml"; docker compose -f "$W/19-image-tag/compose.yaml" up -d; }
s20(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18011:80 -v "$W/20-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s21(){ docker rm -f wg-api; docker run -d --name wg-api -e API_TOKEN=s3cret-token -e LOG_LEVEL=info wg-api:1.0; }
s22(){ printf 'name: wg\nservices:\n  web: {image: nginx:1.27-alpine, container_name: wg-web, networks: [back]}\n  app: {image: busybox:1.36, container_name: wg-app, command: sleep infinity, networks: [back]}\nnetworks:\n  back: {name: wg-back}\n' > "$W/22-compose-network/compose.yaml"; docker compose -f "$W/22-compose-network/compose.yaml" up -d; }
s23(){ sed -i '' 's/networks: \[back\]/networks: [back, front]/' "$W/23-networks/compose.yaml"; docker compose -f "$W/23-networks/compose.yaml" up -d; }
s24(){ printf 'name: wg\nservices:\n  notes: {image: alpine:3.20, container_name: wg-notes, command: sleep infinity, volumes: ["notes:/notes"]}\nvolumes:\n  notes: {name: wg-notes}\n' > "$W/24-compose-volume/compose.yaml"; docker compose -f "$W/24-compose-volume/compose.yaml" up -d; }
s25(){ sed -i '' 's#/var/lib/redis#/data#' "$W/25-volume-lost/compose.yaml"; docker compose -f "$W/25-volume-lost/compose.yaml" up -d; }
s26(){ sed -i '' 's/entrypiont/entrypoint/' "$W/26-build-fails/Dockerfile"; docker build -t wg-tool:1.0 "$W/26-build-fails"; }
s27(){ echo ".cache/" > "$W/27-image-bloat/.dockerignore"; docker build -t wg-app:1.0 "$W/27-image-bloat"; }
s28(){ printf 'name: wg\nservices:\n  web:\n    image: nginx:1.27-alpine\n    container_name: wg-web\n    healthcheck: {test: ["CMD", "wget", "-qO-", "http://localhost/"], interval: 2s, timeout: 2s, retries: 3}\n' > "$W/28-add-healthcheck/compose.yaml"; docker compose -f "$W/28-add-healthcheck/compose.yaml" up -d; }
s29(){ sed -i '' 's/"-p", "6380", //' "$W/29-healthcheck/compose.yaml"; docker compose -f "$W/29-healthcheck/compose.yaml" up -d; }
s30(){ docker update --restart=unless-stopped wg-worker; docker start wg-worker; }
s31(){ awk '/^CMD/{print "RUN adduser -D -u 10001 app"; print "USER app"} {print}' "$W/31-non-root-image/Dockerfile" > "$W/31-non-root-image/Dockerfile.new" && mv "$W/31-non-root-image/Dockerfile.new" "$W/31-non-root-image/Dockerfile"; docker build -t wg-tool:2 "$W/31-non-root-image"; }
s32(){ awk '/^CMD/{print "RUN adduser -D -u 10001 app && chown -R app /app"; print "USER app"} {print}' "$W/32-runs-as-root/Dockerfile" > "$W/32-runs-as-root/Dockerfile.new" && mv "$W/32-runs-as-root/Dockerfile.new" "$W/32-runs-as-root/Dockerfile"
  docker build -t wg-api:1.0 "$W/32-runs-as-root" && docker rm -f wg-api && docker run -d --name wg-api wg-api:1.0; }
s33(){ docker logs wg-web 2>&1 | grep 'GET /checkout' | grep ' 404 ' | grep -o 'rid=.*' | cut -d= -f2- > "$W/33-find-request/answer.txt"; }
s34(){ docker rm $(docker ps -aq -f 'name=^wg-old-'); docker volume rm $(docker volume ls -q -f 'name=^wg-old-'); docker image prune -f; }
s35(){ docker update --memory=128m --memory-swap=128m wg-report && docker start wg-report; }
