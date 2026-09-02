source ../../../lib/common.sh; source ../lib.sh
sedi 's#proxy_pass http://wg-backend:9000/#proxy_pass http://wg-backend:9099/#' "$CONF"
ngx_reload
