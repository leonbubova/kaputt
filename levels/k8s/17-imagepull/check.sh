source ../../../lib/common.sh
wait_available web 2 90 || fail "web has < 2 available replicas"
img=$($K get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}'); [[ "$img" == nginx:1.27* ]] || fail "must stay on nginx 1.27 (is $img)"
ok "web 2/2 on $img"
