# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/nginx/lib.sh"
s01(){ sedi 's/coming soon/new page/' "$CONF"; ngx_reload; }
s02(){ ins_after 'index index.html' '    location = /health { default_type text/plain; return 200 "ok\n"; }'; ngx_reload; }
s03(){ sedi 's/return 200 "up\\n" }/return 200 "up\\n"; }/' "$CONF"; ngx_reload; }
s04(){ ins_after 'index index.html' '    location = /old { return 301 /new; }'; ngx_reload; }
s05(){ ins_after 'index index.html' '    location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }'; ngx_reload; }
s06(){ ins_after 'index index.html' '    add_header X-Frame-Options DENY;'; ngx_reload; }
s07(){ printf 'User-agent: *\nDisallow: /api/\n' > "$APP/html/robots.txt"; }
s08(){ ins_after 'index index.html' '    location /docs/ { try_files $uri $uri/ =404; }'; ngx_reload; }
s09(){ sedi 's/client_max_body_size 10m;/client_max_body_size 512k;/' "$CONF"; ngx_reload; }
s10(){ sedi 's#wg-backend:9099#wg-backend:9000#' "$CONF"; ngx_reload; }
s11(){ sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
s12(){ sedi 's/client_max_body_size 256k;/client_max_body_size 10m;/' "$CONF"; ngx_reload; }
s13(){ sedi '/bogus_directive/d' "$CONF"; docker start wg-nginx >/dev/null 2>&1; sleep 2; }
s14(){ sedi 's#root  /usr/share/nginx/wrong;#root  /usr/share/nginx/html;#' "$CONF"; ngx_reload; }
s15(){ ins_after 'index index.html' '    gzip on; gzip_types application/javascript text/css;'; ngx_reload; }
s16(){ ins_after 'proxy_pass http://wg-backend' '        proxy_set_header Host $host;'; ngx_reload; }
s17(){ sedi 's#wg-backend:9091#wg-backend:9000#' "$CONF"; sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
