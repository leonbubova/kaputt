source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
[ -s "$APP/out/name.txt" ] || fail "out/name.txt missing — did apply succeed?"
tf providers | grep -qF 'hashicorp/random] ~> 3.6' || fail "random is not declared with version ~> 3.6:
$(tf providers | grep -F 'provider[' | sed 's/^/    /')"
ok "random provider declared and pinned"
