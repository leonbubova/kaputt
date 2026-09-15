source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(HDR=X-Frame-Options hdr $URL/)" = DENY ] || fail "X-Frame-Options: DENY not present on /"
ok "X-Frame-Options header present"
