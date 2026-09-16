source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
f=$LAB/fullchain.crt
[ -s "$f" ] || fail "no fullchain.crt in ~/.k8s-wargame/tls/lab yet"
n=$(grep -c 'BEGIN CERTIFICATE' "$f"); [ "$n" = 2 ] || fail "fullchain.crt holds $n certificate(s), wanted 2: leaf then intermediate"
[ "$(cert_subject "$f")" = "CN=shop.local" ] || fail "the first certificate in fullchain.crt is '$(cert_subject "$f")' — the leaf (shop.local) must come first"
second=$(awk '/BEGIN CERTIFICATE/{c++} c==2' "$f" | cert_subject)
[ "$second" = "CN=WG-Intermediate-CA" ] || fail "the second certificate is '$second', wanted the intermediate CN=WG-Intermediate-CA"
openssl verify -CAfile "$LAB/root.crt" -untrusted "$f" "$LAB/leaf.crt" >/dev/null 2>&1 || fail "openssl verify -CAfile root.crt -untrusted fullchain.crt leaf.crt does not say OK"
ok "fullchain.crt = leaf + intermediate; the chain verifies up to the root"
