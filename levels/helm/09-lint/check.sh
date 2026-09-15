source ../../../lib/common.sh; source ../lib.sh
helm lint "$WGH/09-lint/web" >/dev/null 2>&1 || fail "helm lint still fails on your chart copy"
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "<h1>web</h1>" || fail "web not reachable"
ok "chart lints clean and is deployed"
