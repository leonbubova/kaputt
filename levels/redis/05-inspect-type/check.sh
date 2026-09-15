source ../../../lib/common.sh; source ../lib.sh
[ "$(Rt legacy:blob)" = set ] || fail "legacy:blob was changed (type: $(Rt legacy:blob))"
[ "$(R GET audit:legacy:type)" = set ] || fail "audit:legacy:type is '$(R GET audit:legacy:type)', not the type of legacy:blob"
ok "audit:legacy:type records the type of legacy:blob"
