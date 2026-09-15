source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
f=/srv/share/wg-check-$RANDOM
X su - bob -c "echo hi > $f" 2>/dev/null || fail "bob cannot create files in /srv/share"
[ "$(X stat -c %G $f 2>/dev/null)" = dev ] || fail "new file belongs to group $(X stat -c %G $f), not dev"
X su - alice -c "echo by-alice >> $f" 2>/dev/null || fail "alice still cannot write bob's new file"
X rm -f $f >/dev/null 2>&1
ok "shared dir works for the team"
