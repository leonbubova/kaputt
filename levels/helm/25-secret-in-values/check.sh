source ../../../lib/common.sh; source ../lib.sh
pw=s3cret-hunter2; b64=$(printf %s "$pw" | base64)
[ "$(rel_status shop)" = deployed ] || fail "release shop is not deployed ($(rel_status shop))"
helm get values shop -n $NS --all 2>/dev/null | grep -q "$pw" && fail "password still visible in helm get values --all"
helm get manifest shop -n $NS 2>/dev/null | grep -Eq "$pw|$b64" && fail "password still in the rendered manifest"
$K get deploy shop -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="DB_PASSWORD")].valueFrom.secretKeyRef.name}' | grep -q . || fail "DB_PASSWORD is not read from a Secret"
wait_available shop 1 90 || fail "shop has no available replica"
[ "$($K exec deploy/shop -- printenv DB_PASSWORD 2>/dev/null)" = "$pw" ] || fail "app does not receive DB_PASSWORD=$pw"
ok "password lives outside helm, app still gets it"
