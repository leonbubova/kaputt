# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/tls/lib.sh"
# lessons 01–08 (lab folder, openssl only)
s01(){ ( cd "$LAB" && openssl x509 -noout -subject -issuer -in shop.crt > who.txt ); }
s02(){ ( cd "$LAB" && openssl x509 -noout -enddate -in shop.crt > expires.txt ); }
s03(){ ( cd "$LAB" && openssl genrsa -out my.key 2048 ); }
s04(){ ( cd "$LAB" && openssl req -x509 -key my.key -subj /CN=test.local -days 30 -out test.crt ); }
s05(){ ( cd "$LAB" && openssl req -new -key my.key -subj /CN=shop.local -out shop.csr && openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -out shop.crt ); }
s06(){ ( cd "$LAB" && echo subjectAltName=DNS:shop.local > san.ext && openssl x509 -req -in shop.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 30 -extfile san.ext -out shop.crt ); }
s07(){ ( cd "$LAB" && cat leaf.crt int.crt > fullchain.crt ); }
s08(){ ( cd "$LAB" && openssl s_client -connect 127.0.0.1:9443 -servername shop.local </dev/null 2>/dev/null | openssl x509 -out served.crt ); }
# tickets 09–23
s09(){ cat > "$CONF" <<'CONF'
server {
    listen 80;
    server_name shop.local;
    location /health { default_type text/plain; return 200 "ok\n"; }
    location / { default_type text/plain; return 200 "tls ok\n"; }
}
CONF
ngx_restart; }
s10(){ good_conf; ngx_restart; }
s11(){ good_conf; ngx_reload; }
s12(){ good_conf; ngx_reload; }
s13(){ docker start wg-tls >/dev/null 2>&1; sleep 2; }
s14(){ good_conf; ngx_restart; }
s15(){ good_conf; ngx_restart; }
s16(){ good_conf; ngx_restart; }
s17(){ openssl x509 -noout -enddate -in "$APP/certs/fullchain.crt" > "$APP/certs/EXPIRES.txt"; }
s18(){ printf '#!/bin/sh\ncurl -s -o /dev/null --cacert %s/certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/\n' "$APP" > "$APP/verify.sh"; chmod +x "$APP/verify.sh"; }
s19(){ good_conf; ngx_restart; }
s20(){ good_conf; ngx_restart; }
s21(){ good_conf; ngx_reload; }
s22(){ good_conf; ngx_restart; }
s23(){ good_conf; ngx_restart; }
