source ../../../lib/common.sh; source ../lib.sh
XS 'ping -c1 -W2 127.0.0.1 >/dev/null 2>&1' || fail "host still does not answer ICMP"
ok "host answers pings"
