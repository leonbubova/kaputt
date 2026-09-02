source ../../../lib/common.sh; source ../lib.sh
c="$WGH/06-if-block/web"
helm template web "$c" 2>/dev/null | grep -qi "debug" && fail "chart defaults still render a debug line (helm template web ./web) — it must disappear completely when debug is off"
helm template web "$c" --set debug=true 2>/dev/null | grep -q "debug=on" || fail "helm template web ./web --set debug=true does not render debug=on"
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
helm get values web -n $NS 2>/dev/null | grep -q '^debug: true' || fail "the live release was not rolled out with debug=true (helm get values web)"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "debug=on" || fail "page does not show debug=on"
ok "debug block renders only when switched on"
