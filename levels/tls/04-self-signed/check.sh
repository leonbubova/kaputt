source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
c=$LAB/test.crt
[ -s "$c" ] || fail "no test.crt in ~/.k8s-wargame/tls/lab yet"
is_cert "$c" || fail "test.crt is not a certificate (openssl x509 cannot read it)"
[ "$(cert_subject "$c")" = "CN=test.local" ] || fail "subject is '$(cert_subject "$c")', wanted CN=test.local (-subj /CN=test.local)"
[ "$(cert_issuer "$c")" = "$(cert_subject "$c")" ] || fail "issuer differs from subject — not self-signed"
[ "$(cert_pub "$c")" = "$(key_pub "$LAB/my.key")" ] || fail "test.crt does not belong to my.key (its public key is different) — use -key my.key"
ok "test.crt: self-signed for test.local, matches my.key"
