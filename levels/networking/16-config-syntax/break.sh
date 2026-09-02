source ../../../lib/common.sh; source ../lib.sh
ngx_stop
XS "cat > /etc/nginx/sites-enabled/api.conf <<'CONF'
server {
    listen 8080
    location / { default_type text/plain; return 200 \"api ok\\n\"; }
}
CONF"
X nginx >/dev/null 2>&1 || true
