source ../../../lib/common.sh; source ../lib.sh
XS "cat > /etc/nginx/sites-enabled/api.conf <<'CONF'
server {
    listen 8080;
    location / { default_type text/plain; return 200 \"hello\\n\"; }
}
CONF"
ngx_start
