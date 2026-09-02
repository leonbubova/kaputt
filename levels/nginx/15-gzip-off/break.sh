source ../../../lib/common.sh; source ../lib.sh
sedi '/gzip on;/d' "$CONF"
sedi '/gzip_types/d' "$CONF"
ngx_reload
