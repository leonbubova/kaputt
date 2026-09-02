source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi '/Strict-Transport-Security/d' "$CONF"
ngx_reload
