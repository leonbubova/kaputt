source ../../../lib/common.sh; source ../lib.sh
sedi 's#root  /usr/share/nginx/html;#root  /usr/share/nginx/wrong;#' "$CONF"
ngx_reload
