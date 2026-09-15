source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
docker exec wg-nginx test -f /usr/share/nginx/html/robots.txt || fail "no robots.txt in the document root (/usr/share/nginx/html)"
[ "$(code $URL/robots.txt)" = 200 ] || fail "/robots.txt does not return 200"
body $URL/robots.txt | grep -q '^Disallow: /api/' || fail "/robots.txt does not contain 'Disallow: /api/'"
body $URL/robots.txt | grep -qi '^User-agent: \*' || fail "/robots.txt does not contain 'User-agent: *'"
ok "robots.txt served from the document root"
