source ../../../lib/common.sh; source ../lib.sh
running
f=$APP/certs/EXPIRES.txt
[ -s "$f" ] || fail "certs/EXPIRES.txt is missing or empty"
want=$(openssl x509 -noout -enddate -in "$APP/certs/fullchain.crt" 2>/dev/null | sed 's/^notAfter=//')
[ -n "$want" ] || fail "cannot read fullchain.crt"
grep -qF "$want" "$f" || fail "EXPIRES.txt does not contain the certificate's notAfter date"
ok "expiry date recorded"
