source "$WG_ROOT/levels/nestjs/nest.sh"
grep -q 'wg-secret-key' "$APP/src/admin/api-key.guard.ts" && fail "the key is still hard-coded in the guard"
env="$APP/.env"
app_cleanup() { [ -f "$env.wg-bak" ] && mv -f "$env.wg-bak" "$env"; return 0; }
cp "$env" "$env.wg-bak"; printf 'PORT=3200\nAPI_KEY=wg-rotated-key\n' > "$env"
boot_or_fail   # API_KEY is unset in the check's environment on purpose: only .env can supply it
curl -s -m 5 -H 'X-Api-Key: wg-rotated-key' $BASE/admin/stats | grep -q '"users":' || fail "key from .env is rejected ($(code -H 'X-Api-Key: wg-rotated-key' $BASE/admin/stats))"
c=$(code -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "old key should be 401/403 after rotation (got $c)"
c=$(code $BASE/admin/stats); [ "$c" = 401 ] || [ "$c" = 403 ] || fail "missing key should be 401/403 (got $c)"
ok "api key comes from .env"
