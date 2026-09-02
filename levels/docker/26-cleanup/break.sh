source ../../../lib/common.sh; source ../lib.sh
docker volume create wg-web-data >/dev/null
docker run -d --name wg-web -v wg-web-data:/usr/share/nginx/html nginx:1.27-alpine >/dev/null
docker exec wg-web sh -c 'echo "<h1>prod data</h1>" > /usr/share/nginx/html/index.html'
for i in 1 2 3; do docker volume create wg-old-$i >/dev/null; docker run --rm -v wg-old-$i:/d alpine:3.20 sh -c "echo junk > /d/junk" >/dev/null
  docker run --name wg-old-job-$i alpine:3.20 sh -c "echo build $i done" >/dev/null 2>&1; done
d=$(mktemp -d); for i in 1 2 3; do head -c 3145728 /dev/urandom > "$d/blob"; printf 'FROM alpine:3.20\nLABEL wg.track=docker\nCOPY blob /blob\n' > "$d/Dockerfile"
  docker build -q -t wg-junk:latest "$d" >/dev/null 2>&1; done; rm -rf "$d"
