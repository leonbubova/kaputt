source ../../../lib/common.sh; source ../lib.sh
v=$(R GET page:views)
echo "$v" | grep -qE '^[0-9]+$' || fail "page:views is '$v', not an integer"
R INCR page:views >/dev/null 2>&1 || fail "INCR page:views still fails"
ok "page:views is a numeric counter"
