source ../../../lib/common.sh
$K get deploy web >/dev/null 2>&1 || fail "no deployment web"
p='{.spec.template.spec.containers[0].livenessProbe'
[ -n "$($K get deploy web -o jsonpath="$p}")" ] || fail "no livenessProbe on the web container"
[ "$($K get deploy web -o jsonpath="$p.httpGet.path}")" = / ] || fail "probe path is not /"
[ "$($K get deploy web -o jsonpath="$p.httpGet.port}")" = 80 ] || fail "probe port is not 80"
[ "$($K get deploy web -o jsonpath="$p.periodSeconds}")" = 5 ] || fail "periodSeconds is not 5"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image was changed ($img)"
wait_available web 1 90 || fail "web not available"
stable_for app=web 12 || fail "web is restarting — the probe fails"
ok "web has a passing liveness probe on / :80 every 5s"
