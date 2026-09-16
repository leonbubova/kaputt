# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/nginx/lib.sh"
s01(){ mkdir -p "$NOTES"; curl -s -H 'Host: shop.local' http://127.0.0.1:8082/ > "$NOTES/homepage.html"; }
s02(){ echo "hello from nginx" > "$APP/html/hello.txt"; }
s03(){ mkdir -p "$NOTES"; grep -n location "$CONF" > "$NOTES/locations.txt"; }
s04(){ sedi 's/return 200 "ok\\n";/return 200 "alive\\n";/' "$CONF"; ngx_reload; }
s05(){ ins_after 'index index.html' '    location = /ping { default_type text/plain; return 200 "pong\\n"; }'; ngx_reload; }
s06(){ mkdir -p "$NOTES"; curl -s -o /dev/null -H 'Host: shop.local' http://127.0.0.1:8082/missing-page; echo 404 > "$NOTES/status.txt"; }
s07(){ ins_after 'index index.html' '    location /shop/ { proxy_pass http://wg-backend:9000/; }'; ngx_reload; }
s08(){ sedi 's/coming soon/new page/' "$CONF"; ngx_reload; }
s09(){ ins_after 'index index.html' '    location = /health { default_type text/plain; return 200 "ok\n"; }'; ngx_reload; }
s10(){ sedi 's/return 200 "up\\n" }/return 200 "up\\n"; }/' "$CONF"; ngx_reload; }
s11(){ ins_after 'index index.html' '    location = /old { return 301 /new; }'; ngx_reload; }
s12(){ ins_after 'index index.html' '    location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }'; ngx_reload; }
s13(){ ins_after 'index index.html' '    add_header X-Frame-Options DENY;'; ngx_reload; }
s14(){ printf 'User-agent: *\nDisallow: /api/\n' > "$APP/html/robots.txt"; }
s15(){ ins_after 'index index.html' '    location /docs/ { try_files $uri $uri/ =404; }'; ngx_reload; }
s16(){ sedi 's/client_max_body_size 10m;/client_max_body_size 512k;/' "$CONF"; ngx_reload; }
s17(){ sedi 's#wg-backend:9099#wg-backend:9000#' "$CONF"; ngx_reload; }
s18(){ sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
s19(){ sedi 's/client_max_body_size 256k;/client_max_body_size 10m;/' "$CONF"; ngx_reload; }
s20(){ sedi '/bogus_directive/d' "$CONF"; docker start wg-nginx >/dev/null 2>&1; sleep 2; }
s21(){ sedi 's#root  /usr/share/nginx/wrong;#root  /usr/share/nginx/html;#' "$CONF"; ngx_reload; }
s22(){ ins_after 'index index.html' '    gzip on; gzip_types application/javascript text/css;'; ngx_reload; }
s23(){ ins_after 'proxy_pass http://wg-backend' '        proxy_set_header Host $host;'; ngx_reload; }
s24(){ sedi 's#wg-backend:9091#wg-backend:9000#' "$CONF"; sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
