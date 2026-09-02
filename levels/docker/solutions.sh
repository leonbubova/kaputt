# machine-applied solutions, one function per level — used by run-all.sh only
W=$HOME/.k8s-wargame/docker
s01(){ docker run -d --name wg-web -p 127.0.0.1:18001:80 nginx:1.27-alpine; }
s02(){ docker run -d --name wg-app -e REGION=eu-central alpine:3.20 sleep infinity; }
s03(){ printf 'FROM nginx:1.27-alpine\nCOPY index.html /usr/share/nginx/html/index.html\n' > "$W/03-build-image/Dockerfile"; docker build -t wg-site:1 "$W/03-build-image"; }
s04(){ docker run -d --name wg-web -p 127.0.0.1:18004:80 -v "$W/04-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s05(){ docker volume create wg-notes; docker run -d --name wg-notes -v wg-notes:/notes alpine:3.20 sleep infinity; docker exec wg-notes sh -c 'echo "keep me" > /notes/hello.txt'; }
s06(){ docker network create wg-net; docker run -d --name wg-b --network wg-net nginx:1.27-alpine; docker run -d --name wg-a --network wg-net busybox:1.36 sleep infinity; }
s07(){ printf 'services:\n  web: {image: nginx:1.27-alpine, container_name: wg-web, ports: ["127.0.0.1:18007:80"]}\n  cache: {image: redis:7-alpine, container_name: wg-cache}\n' > "$W/07-compose/compose.yaml"; docker compose -p wg -f "$W/07-compose/compose.yaml" up -d; }
s08(){ docker rm -f wg-worker; docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker ready"; exec sleep infinity'; }
s09(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18009:80 nginx:1.27-alpine; }
s10(){ sed -i '' 's/7-alpne/7-alpine/' "$W/10-image-tag/compose.yaml"; docker compose -f "$W/10-image-tag/compose.yaml" up -d; }
s11(){ docker rm -f wg-web; docker run -d --name wg-web -p 127.0.0.1:18011:80 -v "$W/11-bind-mount/site:/usr/share/nginx/html:ro" nginx:1.27-alpine; }
s12(){ docker rm -f wg-api; docker run -d --name wg-api -e API_TOKEN=s3cret-token -e LOG_LEVEL=info wg-api:1.0; }
s13(){ sed -i '' 's/networks: \[back\]/networks: [back, front]/' "$W/13-networks/compose.yaml"; docker compose -f "$W/13-networks/compose.yaml" up -d; }
s14(){ sed -i '' 's#/var/lib/redis#/data#' "$W/14-volume-lost/compose.yaml"; docker compose -f "$W/14-volume-lost/compose.yaml" up -d; }
s15(){ sed -i '' 's/entrypiont/entrypoint/' "$W/15-build-fails/Dockerfile"; docker build -t wg-tool:1.0 "$W/15-build-fails"; }
s16(){ echo ".cache/" > "$W/16-image-bloat/.dockerignore"; docker build -t wg-app:1.0 "$W/16-image-bloat"; }
s17(){ sed -i '' 's/"-p", "6380", //' "$W/17-healthcheck/compose.yaml"; docker compose -f "$W/17-healthcheck/compose.yaml" up -d; }
s18(){ docker update --restart=unless-stopped wg-worker; docker start wg-worker; }
s19(){ awk '/^CMD/{print "RUN adduser -D -u 10001 app && chown -R app /app"; print "USER app"} {print}' "$W/19-runs-as-root/Dockerfile" > "$W/19-runs-as-root/Dockerfile.new" && mv "$W/19-runs-as-root/Dockerfile.new" "$W/19-runs-as-root/Dockerfile"
  docker build -t wg-api:1.0 "$W/19-runs-as-root" && docker rm -f wg-api && docker run -d --name wg-api wg-api:1.0; }
s20(){ docker logs wg-web 2>&1 | grep 'GET /checkout' | grep ' 404 ' | grep -o 'rid=.*' | cut -d= -f2- > "$W/20-find-request/answer.txt"; }
s21(){ docker rm $(docker ps -aq -f 'name=^wg-old-'); docker volume rm $(docker volume ls -q -f 'name=^wg-old-'); docker image prune -f; }
s22(){ docker update --memory=128m --memory-swap=128m wg-report && docker start wg-report; }
