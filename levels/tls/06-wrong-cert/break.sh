source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#/certs/fullchain.crt#/certs/other-fullchain.crt#' "$CONF"
sedi 's#/certs/server.key#/certs/other.key#' "$CONF"
ngx_reload
