source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-page >/dev/null 2>&1 || fail "no container named wg-page yet"
[ "$(image_of wg-page)" = nginx:1.27-alpine ] || fail "wg-page is from image $(image_of wg-page), want nginx:1.27-alpine"
wait_running wg-page || fail "wg-page is not Up — docker logs wg-page"
docker port wg-page 80 2>/dev/null | grep -q ':18105$' || fail "wg-page publishes no port 18105 → 80 — the -p flag: -p 18105:80"
http_get http://localhost:18105/ | grep -q "Welcome to nginx" || fail "http://localhost:18105/ does not answer with the nginx page"
ok "curl localhost:18105 reaches nginx inside wg-page — a port leads in"
