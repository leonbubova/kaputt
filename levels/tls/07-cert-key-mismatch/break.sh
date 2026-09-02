source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#/certs/server.key#/certs/wrong.key#' "$CONF"
ngx_restart
