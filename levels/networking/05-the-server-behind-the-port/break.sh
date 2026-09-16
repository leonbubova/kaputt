source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'
ngx_stop; ngx_start; sleep 1
XS 'pgrep -o nginx > /var/tmp/.wg-ngx0'
