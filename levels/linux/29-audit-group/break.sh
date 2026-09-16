source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
groupdel audit 2>/dev/null || true
usermod -g alice -G dev,operators alice
usermod -g bob -G dev bob
IN
