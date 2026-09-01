source ../../lib/common.sh
wait_available backend 1 60 || fail "backend not available"
$K get networkpolicy default-deny-ingress >/dev/null 2>&1 || fail "default-deny was removed — keep it"
in_cluster_get http://backend.wg.svc/ --labels=role=frontend | grep -q "Welcome to nginx" || fail "frontend cannot reach backend"
if in_cluster_get http://backend.wg.svc/ --labels=role=other >/dev/null 2>&1; then fail "unlabeled pods can reach backend — too open"; fi
ok "frontend → backend allowed, others denied"
