source ../../../lib/common.sh
$K get ingress web >/dev/null 2>&1 || fail "no ingress web"
$K get ingress web -o jsonpath='{.spec.rules[*].host}' | grep -qw web.wg.local || fail "no rule for host web.wg.local"
wait_available web 1 60 || fail "web not available"
for i in $([ -n "${WG_FAST:-}" ] && echo 1 || echo 1 2 3 4 5); do curl -s -m 5 -H 'Host: web.wg.local' http://localhost:8080/ | grep -q "Welcome to nginx" && { ok "web.wg.local routes to web"; exit 0; }; sleep 3; done
fail "curl -H 'Host: web.wg.local' localhost:8080 does not show the welcome page"
