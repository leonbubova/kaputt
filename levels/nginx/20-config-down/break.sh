source ../../../lib/common.sh; source ../lib.sh
printf '\nbogus_directive on;\n' >> "$CONF"
ngx_restart
