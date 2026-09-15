source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
up() { f=$(mktemp); head -c "$1" /dev/zero | tr '\0' a > "$f"; curl -s -k -o /dev/null -m 10 -w '%{http_code}' -H 'Host: shop.local' --data-binary @"$f" $URL/api/upload; rm -f "$f"; }
c=$(up 200000); [ "$c" = 200 ] || fail "200 KB upload returned $c (expected 200)"
c=$(up 800000); [ "$c" = 413 ] || fail "800 KB upload returned $c (expected 413)"
ok "bodies over 512 KB rejected at the edge, small uploads pass"
