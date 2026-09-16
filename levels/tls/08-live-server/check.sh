source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
f=$LAB/served.crt
[ -s "$f" ] || fail "no served.crt in ~/.k8s-wargame/tls/lab yet — pipe s_client into openssl x509 -out served.crt"
is_cert "$f" || fail "served.crt is not a certificate — the pipe into 'openssl x509 -out served.crt' turns the s_client output into one"
[ "$(cert_subject "$f")" = "CN=shop.local" ] || fail "served.crt is for '$(cert_subject "$f")', not shop.local"
[ "$(cert_fp "$f")" = "$(cert_fp "$APP/certs/server.crt")" ] || fail "served.crt is not the certificate wg-tls serves (fingerprints differ) — fetch it from 127.0.0.1:9443, don't copy a file"
ok "served.crt is exactly what wg-tls sends on 9443 — you can inspect a live server"
