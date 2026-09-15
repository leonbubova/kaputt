source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
f=$(outraw last_node) || fail "no output named last_node"
case "$f" in
  *node-2.txt) : ;;
  *) fail "output last_node = '$f', expected the path ending in node-2.txt" ;;
esac
in_state 'local_file.node[2]' || fail "the counted resource is gone from state"
ok "output reads the indexed instance"
