source ../../../lib/common.sh; source ../lib.sh
sedi 's#proxy_pass http://wg-backend:9000/#proxy_pass http://wg-backend:9091/#' "$CONF"
sedi 's#try_files .*#try_files $uri $uri/ =404;#' "$CONF"
ngx_reload
