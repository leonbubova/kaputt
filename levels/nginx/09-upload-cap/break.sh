source ../../../lib/common.sh; source ../lib.sh
sedi 's/client_max_body_size .*/client_max_body_size 10m;/' "$CONF"
ngx_reload
