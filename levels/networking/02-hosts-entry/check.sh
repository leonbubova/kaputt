source ../../../lib/common.sh; source ../lib.sh
XS 'getent hosts api.internal' | grep -q '^127\.0\.0\.1' || fail "api.internal does not resolve to 127.0.0.1"
ok "api.internal resolves to 127.0.0.1"
