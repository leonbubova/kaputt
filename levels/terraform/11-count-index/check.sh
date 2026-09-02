source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
f=$(outraw first) || fail "no output named first"
case "$f" in
  *n-0.txt) : ;;
  *) fail "output first = '$f', expected the path ending in n-0.txt" ;;
esac
ok "counted resource indexed correctly"
