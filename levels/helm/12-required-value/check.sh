source ../../../lib/common.sh; source ../lib.sh
c="$WGH/12-required-value/shop"
helm template shop "$c" >/dev/null 2>&1 && fail "helm template shop ./shop still renders without a domain"
helm template shop "$c" 2>&1 | grep -q "domain is required" || fail "the render error does not say 'domain is required'"
helm template shop "$c" -f "$WGH/12-required-value/values-prod.yaml" >/dev/null 2>&1 || fail "helm template shop ./shop -f values-prod.yaml fails — prod must still render"
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed"
wait_available shop 2 60 || fail "shop does not have 2 available replicas"
in_cluster_get http://shop.wg-helm.svc/ | grep -q "domain=shop.example.com" || fail "page does not show domain=shop.example.com"
ok "domain is required, shop deployed with prod values"
