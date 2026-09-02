source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "no running container named wg-web"
[ "$(image_of wg-web)" = nginx:1.27-alpine ] || fail "image is $(image_of wg-web), want nginx:1.27-alpine"
http_get http://localhost:18004/ | grep -q "draft" || fail "http://localhost:18004/ does not serve site/index.html"
m="live-edit-$RANDOM"; echo "<p>$m</p>" >> "$WORK/site/index.html"
http_get http://localhost:18004/ 3 | grep -q "$m" || fail "host edit to site/index.html is not visible in the container (not a bind mount?)"
ok "site/ is served live"
