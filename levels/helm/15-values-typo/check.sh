source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
helm get manifest web -n $NS | grep -q 'image: "nginx:1.27-alpine"' || fail "helm manifest does not render nginx:1.27-alpine — fix it via helm, not kubectl"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "<h1>web</h1>" || fail "web not reachable"
ok "web renders the right image and runs"
