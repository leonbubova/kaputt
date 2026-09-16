source ../../../lib/common.sh; source ../lib.sh
sedi 's#try_files .*#try_files $uri $uri/ =404;#' "$CONF"
ngx_reload
