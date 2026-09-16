source ../../../lib/common.sh; source ../lib.sh
[ -f "$NOTES/locations.txt" ] || fail "no ~/.k8s-wargame/nginx/notes/locations.txt yet — run the grep from the task with > into that file"
grep -q 'location = /health' "$NOTES/locations.txt" || fail "locations.txt does not list 'location = /health' — grep the shop.local default.conf"
grep -q 'location /api/' "$NOTES/locations.txt" || fail "locations.txt does not list 'location /api/'"
ok "you found every location block — server picks the site, location picks the path"
