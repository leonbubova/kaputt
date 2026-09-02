source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have listing.txt || fail "no listing.txt in the sandbox yet — ls WITH-THE-OPTION > listing.txt"
grep -qF '.secret-note.txt' "$WORK/listing.txt" || fail "listing.txt does not mention .secret-note.txt — the hidden file is missing; find the ls option that shows hidden files (man ls)"
ok "listing.txt shows the hidden file — you found the option yourself"
