source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
for i in 0 1 2; do
  [ -f "$APP/out/node-$i.txt" ] || fail "out/node-$i.txt missing"
  grep -qx "node $i" "$APP/out/node-$i.txt" || fail "out/node-$i.txt content: $(cat "$APP/out/node-$i.txt")"
done
in_state 'local_file.node[2]' || fail "expected a counted resource local_file.node[2] in state"
ok "count created three node files"
