source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
f=$LAB/who.txt
[ -s "$f" ] || fail "no who.txt in ~/.k8s-wargame/tls/lab yet — send the two openssl lines into it with >"
grep -q '^subject=.*CN *= *shop.local' "$f" || fail "who.txt has no 'subject=…CN=shop.local' line (openssl x509 -noout -subject -in shop.crt)"
grep -q '^issuer=.*CN *= *WG-Intermediate-CA' "$f" || fail "who.txt has no 'issuer=…CN=WG-Intermediate-CA' line (openssl x509 -noout -issuer -in shop.crt)"
ok "who.txt: shop.local, signed by WG-Intermediate-CA — you can read a certificate"
