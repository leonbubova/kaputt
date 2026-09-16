source ../../../lib/common.sh; source ../lib.sh
st=$(rel_status web)
[ -n "$st" ] || fail "no release named web in wg-helm yet — helm install web ./web -n wg-helm   (helm list -n wg-helm shows what exists)"
[ "$st" = deployed ] || fail "release web exists but its status is $st, not deployed — helm status web -n wg-helm"
wait_available web 1 60 || fail "release web is there but its pod is not running yet — kubectl get pods -n wg-helm"
ok "release web is deployed and its pod runs"
