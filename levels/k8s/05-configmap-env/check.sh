source ../../../lib/common.sh
[ "$($K get cm app-config -o jsonpath='{.data.GREETING}' 2>/dev/null)" = hello ] || fail "configmap app-config with GREETING=hello missing"
$K get pod greeter >/dev/null 2>&1 || fail "no pod greeter"
$K get pod greeter -o jsonpath='{.spec.containers[*].envFrom[*].configMapRef.name}' | grep -qw app-config || fail "greeter does not use envFrom app-config"
t=60; [ -n "${WG_FAST:-}" ] && t=6; i=0
until $K logs greeter 2>/dev/null | grep -q hello; do sleep 2; i=$((i+2)); [ $i -ge $t ] && fail "greeter logs do not contain 'hello'"; done
ok "greeter says hello from app-config"
