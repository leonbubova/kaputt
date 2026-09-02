source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi '/http2 on;/d' "$CONF"
ngx_reload
