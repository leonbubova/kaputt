source ../../lib/common.sh
wait_available api 1 60 || fail "api has no available replica"
img=$($K get deploy api -o jsonpath='{.spec.template.spec.containers[0].image}'); [ "$img" = busybox:1.36 ] || fail "image was changed ($img)"
stable_for app=api 10 || fail "still restarting"
ok "api is up and stable"
