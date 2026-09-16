source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
grep -q 'return 200 "alive\\n";' "$CONF" || fail "default.conf has no 'return 200 \"alive\\n\";' in the /health block yet"
[ "$(body $URL/health)" = alive ] || fail "/health still answers '$(body $URL/health)' — the file is changed, nginx has not re-read it: docker exec wg-nginx nginx -s reload"
ok "/health says alive — edit, save, reload"
