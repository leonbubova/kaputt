source ../../../lib/common.sh; source ../lib.sh
sedi '/proxy_set_header Host/d' "$CONF"
ngx_reload
