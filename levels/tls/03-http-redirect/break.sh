source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#return 301[^;]*;#return 200 "tls ok";#' "$CONF"
ngx_reload
