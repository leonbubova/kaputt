source ../../../lib/common.sh; source ../lib.sh
sedi '/X-Frame-Options/d' "$CONF"
ngx_reload
