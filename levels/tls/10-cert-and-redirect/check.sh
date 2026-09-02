source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
verify_host || fail "chain still does not verify"
[ "$(hcode)" = 301 ] || fail "http not redirected (got $(hcode))"
case "$(hloc)" in https://*) ;; *) fail "redirect target is not https";; esac
ok "chain verifies and HTTP redirects to HTTPS"
