source ../../../lib/common.sh; source ../lib.sh
good_conf
rm -f "$APP/certs/EXPIRES.txt"
ngx_reload
