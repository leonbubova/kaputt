source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'; ngx_start
X ip addr del 10.99.0.5/32 dev eth0 >/dev/null 2>&1 || true
