source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
have env.txt || fail "no env.txt in the sandbox yet — env > ~/.k8s-wargame/shell/sandbox/env.txt"
if ! grep -qx 'FAVORITE_COLOR=blue' "$WORK/env.txt"; then
  line=$(grep -i '^favorite_color=' "$WORK/env.txt" | head -1)
  [ -n "$line" ] && fail "env.txt has '$line' — expected exactly FAVORITE_COLOR=blue (capitals, lowercase blue)"
  fail "FAVORITE_COLOR is not in env.txt — set it, export it, THEN run env > … again (only exported variables show up in env)"
fi
ok "FAVORITE_COLOR=blue is in the environment — set, exported, captured"
