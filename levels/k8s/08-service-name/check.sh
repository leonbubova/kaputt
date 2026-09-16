source ../../../lib/common.sh
$K get svc web >/dev/null 2>&1 || fail "service web is gone — wg reset brings it back"
[ "$($K get pod box -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ] || fail "pod box is not Running — kubectl get pods (still ContainerCreating? wait a moment; gone? wg reset)"
page=$($K exec box -- cat /tmp/page.html 2>/dev/null)
[ -n "$page" ] || fail "no /tmp/page.html inside box yet — exec into box, then wget -qO- http://web/ > /tmp/page.html"
echo "$page" | grep -q "Welcome to nginx" || fail "/tmp/page.html inside box is not the nginx page — fetch it from http://web/"
ok "box fetched the page through the Service web and saved it"
