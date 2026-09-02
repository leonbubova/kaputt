source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
hdr=$(curl -s -m 5 -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' -H 'Access-Control-Request-Headers: x-api-key' $BASE/admin/stats)
echo "$hdr" | grep -qi 'access-control-allow-origin: http://localhost:5173' || fail "preflight lacks Allow-Origin for localhost:5173"
echo "$hdr" | grep -i 'access-control-allow-headers:' | grep -qiE 'x-api-key|\*' || fail "preflight does not allow X-Api-Key"
curl -s -m 5 -i -X OPTIONS -H 'Origin: http://evil.example' -H 'Access-Control-Request-Method: GET' $BASE/admin/stats | grep -qi 'access-control-allow-origin: http://evil.example' && fail "origin must stay restricted"
curl -s -m 5 -H 'X-Api-Key: wg-secret-key' $BASE/admin/stats | grep -q '"users":' || fail "/admin/stats broken"
ok "preflight allows X-Api-Key"
