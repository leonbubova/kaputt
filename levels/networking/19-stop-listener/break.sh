source ../../../lib/common.sh; source ../lib.sh
site 'listen 8080;'; ngx_start
X pgrep -f 'nc -lk 9090' >/dev/null 2>&1 || { XD sh -c 'nc -lk 9090'; sleep 1; }
