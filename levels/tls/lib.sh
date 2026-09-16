# tls-track helpers — sourced after lib/common.sh (cwd = level dir)
WG_TLS=$HOME/.k8s-wargame/tls; APP=$WG_TLS/app; CONF=$APP/conf.d/default.conf
URL=https://127.0.0.1:9443; HURL=http://127.0.0.1:9080
sedi() { if sed --version >/dev/null 2>&1; then sed -i "$@"; else sed -i '' "$@"; fi; }
# write the correct (target) config to $CONF
good_conf() {
  cat > "$CONF" <<'CONF'
server {
    listen 80;
    server_name shop.local;
    return 301 https://$host$request_uri;
}
server {
    listen 443 ssl;
    server_name shop.local;
    ssl_certificate     /etc/nginx/certs/fullchain.crt;
    ssl_certificate_key /etc/nginx/certs/server.key;
    http2 on;
    ssl_protocols TLSv1.2 TLSv1.3;
    add_header Strict-Transport-Security "max-age=31536000" always;
    location / { default_type text/plain; return 200 "tls ok\n"; }
}
CONF
}
ngx_reload()  { docker exec wg-tls nginx -s reload >/dev/null 2>&1 || docker restart wg-tls >/dev/null 2>&1; sleep 1; }
ngx_restart() { docker restart wg-tls >/dev/null 2>&1 || true; sleep 2; }
codek() { curl -sk -o /dev/null -m 5 -w '%{http_code}' "$1"; }        # https, ignore cert
bodyk() { curl -sk -m 5 "$1"; }
hcode() { curl -s  -o /dev/null -m 5 -w '%{http_code}' "$HURL/"; }     # plain http status
hloc()  { curl -s  -o /dev/null -m 5 -w '%{redirect_url}' "$HURL/"; }
# verify server cert + hostname against our CA (exit 0 = trusted & hostname matches)
verify_host() { curl -s -m 5 --cacert "$APP/certs/root.crt" --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/ >/dev/null 2>&1; }
running()  { [ "$(docker inspect -f '{{.State.Running}}' wg-tls 2>/dev/null)" = true ] || fail "wg-tls is not running — docker logs wg-tls, then docker start wg-tls"; }
conf_ok()  { docker exec wg-tls nginx -t >/dev/null 2>&1 || fail "nginx -t fails inside wg-tls"; }
# ---- lessons 01–08: a scratch folder for playing with certs by hand (reset by each lesson's break.sh)
LAB=$WG_TLS/lab
lab_reset() { rm -rf "$LAB"; mkdir -p "$LAB"; }
_dn() { sed 's/^[a-z]*= *\/*//; s/ *= */=/g; s/ *, */,/g'; }                    # "subject= /CN = x" → "CN=x" (openssl 3 + libressl)
cert_subject() { openssl x509 -noout -subject ${1:+-in "$1"} 2>/dev/null | _dn; }   # file or stdin; e.g. CN=shop.local
cert_issuer()  { openssl x509 -noout -issuer  ${1:+-in "$1"} 2>/dev/null | _dn; }
cert_san()     { openssl x509 -noout -text    -in "$1" 2>/dev/null | grep -o 'DNS:[^,[:space:]]*' | tr '\n' ' '; }
cert_fp()      { openssl x509 -noout -fingerprint -sha256 -in "$1" 2>/dev/null | cut -d= -f2; }
cert_pub()     { openssl x509 -noout -pubkey -in "$1" 2>/dev/null; }
key_pub()      { openssl pkey -in "$1" -pubout 2>/dev/null; }
is_cert()      { openssl x509 -noout -in "$1" >/dev/null 2>&1; }
