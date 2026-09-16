source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS greeting)" = 1 ] || fail "no key greeting yet — open wg shell and type: SET greeting hello"
[ "$(R GET greeting)" = hello ] || fail "greeting holds '$(R GET greeting)' — it should hold exactly: hello"
ok "GET greeting answers hello — your first key"
