source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have backup.sh || fail "backup.sh is gone — wg reset"
grep -q 'cp .*notes' "$WORK/backup.sh" || fail "backup.sh was rewritten — wg reset; the script itself is correct, something about the file stops it from running"
[ -x "$WORK/backup.sh" ] || { [ -d "$WORK/backup" ] && fail "backup/ exists, but your colleague still cannot run ./backup.sh — the file itself must be allowed to execute"; fail "./backup.sh still cannot run — read the error message again: which category is it?"; }
for f in monday tuesday wednesday; do
  have "backup/$f.txt" || fail "backup/$f.txt is missing — backup.sh can run now, but has it been run? ./backup.sh"
  cmp -s "$WORK/notes/$f.txt" "$WORK/backup/$f.txt" || fail "backup/$f.txt differs from notes/$f.txt"
done
ok "backup.sh runs and backed up all three notes — your first incident, closed. Welcome to the wargame."
