source ../../../lib/common.sh; source ../lib.sh
wait_running wg-web || fail "wg-web not running"
http_get http://localhost:18011/ | grep -q "wg landing page" || fail "landing page not served ($(curl -s -o /dev/null -w '%{http_code}' -m 3 http://localhost:18011/))"
docker inspect -f '{{range .Mounts}}{{.Type}} {{.Source}} {{.Destination}}{{"\n"}}{{end}}' wg-web | grep -q "^bind .*/site /usr/share/nginx/html" || fail "site/ is not bind-mounted at /usr/share/nginx/html"
ok "landing page served from bind mount"
