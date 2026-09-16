source ../../../lib/common.sh; source ../lib.sh
docker image inspect wg-site:1 >/dev/null 2>&1 || fail "image wg-site:1 does not exist — docker build -t wg-site:1 ."
docker rm -f wg-site-check >/dev/null 2>&1
docker run -d --rm --name wg-site-check -p 127.0.0.1:18003:80 wg-site:1 >/dev/null 2>&1 || fail "cannot start a container from wg-site:1"
body=$(http_get http://localhost:18003/); docker rm -f wg-site-check >/dev/null 2>&1
echo "$body" | grep -q "shipped as an image" || fail "container from wg-site:1 does not serve index.html on port 80"
ok "wg-site:1 serves the page"
