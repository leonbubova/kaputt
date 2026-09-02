# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/tls/lib.sh"
s01(){ cat > "$CONF" <<'CONF'
server {
    listen 80;
    server_name shop.local;
    location /health { default_type text/plain; return 200 "ok\n"; }
    location / { default_type text/plain; return 200 "tls ok\n"; }
}
CONF
ngx_restart; }
s02(){ good_conf; ngx_restart; }
s03(){ good_conf; ngx_reload; }
s04(){ good_conf; ngx_reload; }
s05(){ docker start wg-tls >/dev/null 2>&1; sleep 2; }
s06(){ good_conf; ngx_restart; }
s07(){ good_conf; ngx_restart; }
s08(){ good_conf; ngx_restart; }
s09(){ openssl x509 -noout -enddate -in "$APP/certs/fullchain.crt" > "$APP/certs/EXPIRES.txt"; }
s10(){ printf '#!/bin/sh\ncurl -s -o /dev/null --cacert %s/certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/\n' "$APP" > "$APP/verify.sh"; chmod +x "$APP/verify.sh"; }
s11(){ good_conf; ngx_restart; }
s12(){ good_conf; ngx_restart; }
s13(){ good_conf; ngx_reload; }
s14(){ good_conf; ngx_restart; }
s15(){ good_conf; ngx_restart; }
