source ../../../lib/common.sh; source ../lib.sh
grep -q '^environment: test$' "$WGH/05-change-and-upgrade/web/values.yaml" || fail "web/values.yaml still does not say 'environment: test' — edit that line first"
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed — helm status web -n wg-helm"
[ "$(rel_revs web)" -ge 2 ] || fail "helm history web -n wg-helm shows only revision 1 — run helm upgrade web ./web -n wg-helm"
wait_available web 1 60 || fail "web has no running pod after the upgrade — kubectl get pods -n wg-helm"
in_cluster_get http://web.wg-helm.svc/ | grep -q 'env=test' || fail "the page does not show env=test yet — was the upgrade run from the changed chart folder?"
ok "web upgraded to revision 2, page shows env=test"
