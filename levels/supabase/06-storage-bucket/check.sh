source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(*) from storage.buckets where id='uploads'")" = 1 ] || fail "no bucket 'uploads'"
[ "$(sql "select public from storage.buckets where id='uploads'")" = t ] || fail "bucket uploads is not public"
sb_env
body=$(rest_svc POST "/storage/v1/object/uploads/wg-check.txt" -H "Content-Type: text/plain" -H "x-upsert: true" --data 'wg-check') || fail "storage API unreachable"
[ "$(rest_code)" = 200 ] || fail "upload → $(rest_code): $body"
out=$(curl -s -m 10 -w '\n%{http_code}' "$API_URL/storage/v1/object/public/uploads/wg-check.txt"); code=${out##*$'\n'}
[ "$code" = 200 ] && [ "${out%$'\n'*}" = wg-check ] || fail "public URL → $code"
ok "bucket uploads exists, public, serves files"
