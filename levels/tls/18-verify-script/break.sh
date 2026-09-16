source ../../../lib/common.sh; source ../lib.sh
good_conf
rm -f "$APP/verify.sh"
ngx_reload
