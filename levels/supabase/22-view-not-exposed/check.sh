source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
try() { body=$(rest_anon GET "/rest/v1/top_articles?select=id,title,views") && [ "$(rest_code)" = 200 ] && [ "$(json_len "$body")" -ge 3 ]; }
retry 15 try || fail "GET /rest/v1/top_articles → ${REST_CODE:-?}: ${body:-} (want 200 with 3 rows)"
printf '%s' "$body" | grep -q '"Draft"' && fail "unpublished article leaked — keep the view's filter"
ok "top_articles is served by the API"
