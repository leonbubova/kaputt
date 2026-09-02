# shared by trigger levels — sourced after lib/common.sh
WG_TRIG=${WG_TRIG:-$HOME/.k8s-wargame/trigger}; WG_APP=${WG_APP:-$WG_TRIG/app}; export WG_APP
BIN="$WG_TRIG/node_modules/.bin"
HERE=$(pwd); LEVEL=$(basename "$HERE")
app_cd() { cd "$WG_APP" || fail "play area missing — wg start"; }
# type-check the whole project (what `trigger.dev deploy` would not do for you, but your CI does)
wg_tsc() { app_cd; out=$("$BIN/tsc" --noEmit -p . 2>&1) || { echo "$out" | head -15; fail "tsc --noEmit fails"; }; cd "$HERE"; }
# run the level's spec against the app: copies harness + spec into $WG_APP/wg-check/
wg_spec() { # spec-file
  app_cd; rm -rf wg-check; mkdir wg-check
  cp "$WG_ROOT/levels/trigger/harness/harness.ts" wg-check/; cp "$HERE/$1" wg-check/check.spec.ts
  out=$(WG_APP="$WG_APP" "$BIN/vitest" run --root "$WG_APP" --dir wg-check --reporter=verbose --testTimeout=20000 2>&1); rc=$?
  rm -rf wg-check; cd "$HERE"
  if [ $rc -ne 0 ]; then echo "$out" | grep -E "^ *(✓|×|→|❯ wg-check)|^[A-Za-z]*Error:|Test timed out|message" | grep -v "Serialized Error" | sed 's/^ *//' | head -12; return 1; fi
  echo "$out" | grep -E "✓" | sed 's/^ *//' | head -12; return 0
}
