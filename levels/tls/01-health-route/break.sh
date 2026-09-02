source ../../../lib/common.sh; source ../lib.sh
cat > "$CONF" <<'CONF'
server {
    listen 80;
    server_name shop.local;
    location / { default_type text/plain; return 200 "tls ok\n"; }
}
CONF
ngx_restart
