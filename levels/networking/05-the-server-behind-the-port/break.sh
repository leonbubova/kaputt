source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'
ngx_stop; ngx_start; sleep 1
X sh -c "pgrep -o -f 'nginx: master process' > /var/tmp/.wg-ngx0"
