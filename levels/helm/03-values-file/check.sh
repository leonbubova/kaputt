source ../../../lib/common.sh; source ../lib.sh
f="$WGH/03-values-file/values-prod.yaml"; [ -f "$f" ] || fail "no values-prod.yaml in ~/.k8s-wargame/helm/03-values-file/"
grep -q 'shop.example.com' "$f" || fail "values-prod.yaml does not set the domain"
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
helm get values shop -n $NS 2>/dev/null | grep -q 'shop.example.com' || fail "domain was not passed to helm as a value (helm get values shop)"
wait_available shop 2 60 || fail "shop does not have 2 available replicas"
body=$(in_cluster_get http://shop.wg-helm.svc/)
echo "$body" | grep -q "env=prod" || fail "page does not show env=prod"
echo "$body" | grep -q "domain=shop.example.com" || fail "page does not show domain=shop.example.com"
ok "shop installed with values-prod.yaml"
