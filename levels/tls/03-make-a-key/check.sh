source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
k=$LAB/my.key
[ -s "$k" ] || fail "no my.key in ~/.k8s-wargame/tls/lab yet (openssl genrsa -out my.key 2048)"
openssl rsa -noout -check -in "$k" >/dev/null 2>&1 || fail "my.key is not a valid RSA private key"
bits=$(openssl rsa -noout -text -in "$k" 2>/dev/null | sed -n 's/.*Private-Key: (\([0-9]*\) bit.*/\1/p' | head -1)
[ "$bits" = 2048 ] || fail "my.key is ${bits:-?} bits, wanted 2048"
ok "my.key is a 2048-bit RSA private key — keep it secret"
