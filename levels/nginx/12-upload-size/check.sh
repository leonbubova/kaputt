source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
f=$(mktemp); head -c 600000 /dev/zero | tr '\0' a > "$f"
c=$(curl -s -k -o /dev/null -m 10 -w '%{http_code}' -H 'Host: shop.local' --data-binary @"$f" $URL/api/upload)
rm -f "$f"
[ "$c" = 200 ] || fail "600 KB upload returned $c (expected 200)"
ok "medium uploads accepted at the edge"
