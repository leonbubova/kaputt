source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(hcode)" = 301 ] || fail "http://:9080/ returns $(hcode), not 301"
case "$(hloc)" in https://*) ;; *) fail "redirect target is not https (got $(hloc))";; esac
ok "HTTP redirects to HTTPS"
