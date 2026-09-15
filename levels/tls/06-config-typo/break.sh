source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's/ssl_protocols /ssl_protocol /' "$CONF"
ngx_restart
