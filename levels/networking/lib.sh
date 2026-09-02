# networking-track helpers — sourced after lib/common.sh (cwd = level dir)
C=${WG_NET_C:-wg-net}
X()  { docker exec "$C" "$@"; }
XS() { docker exec "$C" bash -c "$1"; }
XD() { docker exec -d "$C" "$@"; }
cip() { docker exec "$C" hostname -I | awk '{print $1}'; }   # container primary IP
# write the api site config with a given listen directive, e.g. site 'listen 8080;'
site() {
  XS "cat > /etc/nginx/sites-enabled/api.conf <<'CONF'
server {
    $1
    location / { default_type text/plain; return 200 \"api ok\\n\"; }
}
CONF"
}
ngx_start()  { X nginx >/dev/null 2>&1; }
ngx_reload() { X nginx -s reload >/dev/null 2>&1 || X nginx >/dev/null 2>&1; }
ngx_stop()   { X nginx -s stop >/dev/null 2>&1 || true; X pkill -x nginx >/dev/null 2>&1 || true; sleep 1; }
inurl() { XS "curl -fsS -m 3 $1" 2>/dev/null; }              # inurl localhost:8080
