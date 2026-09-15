source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X getent hosts mock.internal >/dev/null 2>&1 || fail "mock.internal does not resolve on the box"
X curl -s --max-time 4 http://mock.internal:9200/ 2>/dev/null | grep -q "mock ok" || fail "curl http://mock.internal:9200/ does not print 'mock ok'"
ok "mock.internal resolves"
