source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
c=$LAB/shop.crt
[ -s "$c" ] || fail "no shop.crt in ~/.k8s-wargame/tls/lab yet"
is_cert "$c" || fail "shop.crt is not a certificate"
[ "$(cert_issuer "$c")" = "CN=WG-Root-CA" ] || fail "shop.crt is not signed by the CA (issuer '$(cert_issuer "$c")')"
[ "$(cert_pub "$c")" = "$(key_pub "$LAB/my.key")" ] || fail "shop.crt does not belong to my.key — sign shop.csr, not something else"
case " $(cert_san "$c")" in *" DNS:shop.local"*) ;; *) fail "shop.crt has no SAN DNS:shop.local (got: '$(cert_san "$c")') — pass -extfile san.ext when signing";; esac
ok "shop.crt carries SAN DNS:shop.local — clients will accept it for that name"
