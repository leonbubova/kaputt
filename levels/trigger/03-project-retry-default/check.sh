source "$WG_ROOT/lib/common.sh"; source ../lib.sh
wg_tsc
wg_spec check.spec.ts || fail "see above"
ok "$LEVEL solved"
