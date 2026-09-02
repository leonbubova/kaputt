source ../../../lib/common.sh; source ../lib.sh
del_block 'location /api/'
ngx_reload
