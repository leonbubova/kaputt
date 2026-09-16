source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail   # API_KEY is unset in the check's environment on purpose
curl -s -m 5 -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats | grep -q '"users":' || fail "correct key gets $(code -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats)"
c=$(code $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "missing key should be 401/403 (got $c)"
ok "config loaded from .env"
