source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/old)" = 301 ] || fail "/old does not return 301 (got $(code $URL/old))"
loc=$(HDR=Location hdr $URL/old)
case "$loc" in */new) ;; *) fail "Location is '$loc', expected to end in /new";; esac
ok "/old redirects to /new"
