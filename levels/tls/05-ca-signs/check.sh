source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
c=$LAB/shop.crt
[ -s "$c" ] || fail "no shop.crt in ~/.k8s-wargame/tls/lab yet"
is_cert "$c" || fail "shop.crt is not a certificate (openssl x509 cannot read it) — did you sign the request with openssl x509 -req?"
[ "$(cert_subject "$c")" = "CN=shop.local" ] || fail "subject is '$(cert_subject "$c")', wanted CN=shop.local"
[ "$(cert_issuer "$c")" = "CN=WG-Root-CA" ] || fail "issuer is '$(cert_issuer "$c")', wanted CN=WG-Root-CA — sign it with -CA ca.crt -CAkey ca.key"
[ "$(cert_pub "$c")" = "$(key_pub "$LAB/my.key")" ] || fail "shop.crt does not belong to my.key — make the request with -key my.key"
openssl verify -CAfile "$LAB/ca.crt" "$c" >/dev/null 2>&1 || fail "ca.crt does not verify shop.crt — the signature is not from ca.key"
ok "shop.crt: shop.local, signed by WG-Root-CA, matches my.key"
