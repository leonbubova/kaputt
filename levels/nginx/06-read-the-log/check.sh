source ../../../lib/common.sh; source ../lib.sh
running
docker logs wg-nginx 2>&1 | grep -q 'GET /missing-page ' || fail "no request for /missing-page in docker logs wg-nginx yet — curl it first (with -H 'Host: shop.local')"
[ -f "$NOTES/status.txt" ] || fail "no ~/.k8s-wargame/nginx/notes/status.txt yet — write the status code from the log line into it"
got=$(tr -d '[:space:]' < "$NOTES/status.txt")
[ "$got" = 404 ] || fail "status.txt says '$got' — look at the number after \"GET /missing-page HTTP/1.1\" in the log"
ok "404 — you read a request's outcome from the log"
