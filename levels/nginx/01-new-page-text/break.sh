source ../../../lib/common.sh; source ../lib.sh
sedi 's/return 200 "new page\\n";/return 200 "coming soon\\n";/' "$CONF"
ngx_reload
