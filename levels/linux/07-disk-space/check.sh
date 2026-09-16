source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /var/lib/appdata/cache/blob.bin 2>/dev/null || fail "the big file was deleted — the task was to name the folder, not empty it (wg reset)"
a=$(X cat /answer 2>/dev/null | tr -d '[:space:]/'); a=${a##*appdata}
[ -n "$a" ] || fail "no /answer on the box yet — write the folder name into it"
[ "$a" = cache ] || fail "/answer says '${a}' — du -sh /var/lib/appdata/* shows which folder is biggest"
ok "cache it is — you measured folders with du"
