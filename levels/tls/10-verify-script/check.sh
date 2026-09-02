source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
s=$APP/verify.sh
[ -s "$s" ] || fail "verify.sh does not exist"
grep -Eq -- '(^|[[:space:]])-[a-zA-Z]*k([[:space:]]|$)|--insecure' "$s" && fail "verify.sh still skips verification (-k / --insecure)"
grep -q -- '--cacert' "$s" || fail "verify.sh does not pin our CA (--cacert)"
grep -q 'shop.local' "$s" || fail "verify.sh does not verify the hostname shop.local"
(cd "$APP" && sh "$s" >/dev/null 2>&1) || fail "verify.sh exits non-zero although the served cert is valid"
ok "verify.sh verifies chain and hostname"
