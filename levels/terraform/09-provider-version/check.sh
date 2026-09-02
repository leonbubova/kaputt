source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -s "$APP/out/name.txt" ] || fail "out/name.txt missing — did init/apply succeed?"
ok "provider constraint satisfiable, apply works"
