# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/nginx/lib.sh"
s01(){ ins_after 'index index.html' '    location = /health { default_type text/plain; return 200 "ok\n"; }'; ngx_reload; }
s02(){ ins_after 'index index.html' '    location = /old { return 301 /new; }'; ngx_reload; }
s03(){ ins_after 'index index.html' '    location /api/ { proxy_pass http://wg-backend:9000/; proxy_set_header Host $host; }'; ngx_reload; }
s04(){ ins_after 'index index.html' '    add_header X-Frame-Options DENY;'; ngx_reload; }
s05(){ sedi 's#wg-backend:9099#wg-backend:9000#' "$CONF"; ngx_reload; }
s06(){ sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
s07(){ sedi 's/client_max_body_size 256k;/client_max_body_size 10m;/' "$CONF"; ngx_reload; }
s08(){ sedi '/bogus_directive/d' "$CONF"; docker start wg-nginx >/dev/null 2>&1; sleep 2; }
s09(){ sedi 's#root  /usr/share/nginx/wrong;#root  /usr/share/nginx/html;#' "$CONF"; ngx_reload; }
s10(){ ins_after 'index index.html' '    gzip on; gzip_types application/javascript text/css;'; ngx_reload; }
s11(){ ins_after 'proxy_pass http://wg-backend' '        proxy_set_header Host $host;'; ngx_reload; }
s12(){ sedi 's#wg-backend:9091#wg-backend:9000#' "$CONF"; sedi 's#try_files .*#try_files $uri $uri/ /index.html;#' "$CONF"; ngx_reload; }
