source ../../../lib/common.sh; source ../lib.sh
running
[ -f "$NOTES/homepage.html" ] || fail "no ~/.k8s-wargame/nginx/notes/homepage.html yet — send curl's output into that file with >"
grep -q 'Welcome to shop.local' "$NOTES/homepage.html" || fail "homepage.html does not contain 'Welcome to shop.local' — did the request carry -H 'Host: shop.local'?"
ok "homepage.html holds the page nginx sent — you talked to a web server"
