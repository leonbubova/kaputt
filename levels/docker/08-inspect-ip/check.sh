source ../../../lib/common.sh; source ../lib.sh
running wg-web || fail "wg-web is not running anymore — don't restart it"
f="$WORK/ip.txt"; [ -s "$f" ] || fail "no ip.txt in $WORK"
want=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' wg-web)
[ "$(tr -d ' \n\r' < "$f")" = "$want" ] || fail "ip.txt does not contain the IP of wg-web (just the address, one line)"
ok "ip.txt has ${want}"
