source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#/certs/fullchain.crt#/certs/server.crt#' "$CONF"
ngx_reload
