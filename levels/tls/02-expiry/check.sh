source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
f=$LAB/expires.txt
[ -s "$f" ] || fail "no expires.txt in ~/.k8s-wargame/tls/lab yet"
want=$(openssl x509 -noout -enddate -in "$LAB/shop.crt" 2>/dev/null)
[ -n "$want" ] || fail "cannot read lab/shop.crt — wg reset"
grep -qF "$want" "$f" || fail "expires.txt does not contain the line '$want'"
ok "expires.txt holds the notAfter date — you know when a certificate dies"
