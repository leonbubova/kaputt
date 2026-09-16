source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /home/alice/note.txt 2>/dev/null || fail "no /home/alice/note.txt on the box yet"
o=$(X stat -c %U /home/alice/note.txt 2>/dev/null); [ "$o" = alice ] || fail "note.txt was created by '${o}', not by alice — su - alice first, then create it"
ok "note.txt belongs to alice — you switched user and worked as her"
