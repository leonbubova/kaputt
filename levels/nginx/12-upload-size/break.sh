source ../../../lib/common.sh; source ../lib.sh
sedi 's/client_max_body_size 10m;/client_max_body_size 256k;/' "$CONF"
ngx_reload
