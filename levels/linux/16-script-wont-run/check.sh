source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X grep -q 'post-deploy healthcheck' /opt/tools/healthcheck.sh 2>/dev/null || fail "script was replaced"
X /opt/tools/healthcheck.sh 2>/dev/null | grep -q "healthcheck ok" || fail "/opt/tools/healthcheck.sh does not run"
ok "hook runs"
