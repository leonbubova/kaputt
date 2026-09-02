source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
[ -d "$WORK/project" ] || fail "no folder project in the sandbox yet — mkdir makes one"
have project/notes.txt || fail "project exists but has no notes.txt inside — touch project/notes.txt"
ok "project/notes.txt exists — you made a folder and a file"
