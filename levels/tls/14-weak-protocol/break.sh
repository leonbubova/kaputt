source ../../../lib/common.sh; source ../lib.sh
good_conf
sedi 's#ssl_protocols .*#ssl_protocols TLSv1.1;#' "$CONF"
ngx_reload
