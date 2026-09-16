source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "no running container named wg-web"
[ "$(image_of wg-web)" = nginx:1.27-alpine ] || fail "image is $(image_of wg-web), want nginx:1.27-alpine"
http_get http://localhost:18001/ | grep -q "Welcome to nginx" || fail "http://localhost:18001/ does not answer with nginx"
ok "wg-web serves on :18001"
