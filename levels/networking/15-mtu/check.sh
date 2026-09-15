source ../../../lib/common.sh; source ../lib.sh
[ "$(X cat /sys/class/net/eth0/mtu 2>/dev/null)" = 1500 ] || fail "eth0 MTU is $(X cat /sys/class/net/eth0/mtu 2>/dev/null), expected 1500"
ok "eth0 MTU restored to 1500"
