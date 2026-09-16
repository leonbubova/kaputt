source ../../../lib/common.sh; source ../lib.sh
grep -q '= /status' "$CONF" || ins_after 'index index.html' '    location = /status { default_type text/plain; return 200 "up\\n" }'
ngx_reload
