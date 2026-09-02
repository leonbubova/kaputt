source ../../../lib/common.sh; source ../lib.sh
[ -f "$WGH/01-create-install/hello/Chart.yaml" ] || fail "no chart at ~/.k8s-wargame/helm/01-create-install/hello (helm create)"
[ "$(rel_status wg-hello)" = deployed ] || fail "release wg-hello is not deployed in wg-helm"
dep=$($K get deploy -l app.kubernetes.io/instance=wg-hello -o jsonpath='{.items[0].metadata.name}' 2>/dev/null); [ -n "$dep" ] || fail "release wg-hello created no Deployment"
img=$($K get deploy "$dep" -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = nginx:1.27-alpine ] || fail "image is $img (want nginx:1.27-alpine)"
wait_available "$dep" 1 60 || fail "$dep has no available replica"
ok "wg-hello deployed from your own chart"
