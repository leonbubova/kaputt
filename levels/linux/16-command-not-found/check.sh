source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X su - deploy -c 'ls / >/dev/null && deploytool' 2>/dev/null | grep -q "deploytool 1.0 ok" || fail "login shell of deploy still broken"
ok "deploy PATH sane"
