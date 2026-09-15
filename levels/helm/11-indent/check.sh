source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
[ "$($K get cm web-html -o jsonpath='{.data.robots\.txt}' | wc -l | tr -d ' ')" -ge 1 ] || fail "configmap web-html has no robots.txt"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "hello from the configmap" || fail "index.html not served from the configmap"
ok "configmap renders as valid yaml, web serves it"
