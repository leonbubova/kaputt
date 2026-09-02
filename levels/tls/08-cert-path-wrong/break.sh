source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#/certs/fullchain.crt#/certs/missing.crt#' "$CONF"
ngx_restart
