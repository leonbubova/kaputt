# track: Trigger.dev v4 task code — no cloud, no dev server. See README-track.md.
WG_TRIG=${WG_TRIG:-$HOME/.k8s-wargame/trigger}   # $WG_TRIG/node_modules (shared), $WG_TRIG/app (play area)
WG_APP=$WG_TRIG/app; export WG_APP
_tmpl() { echo "$WG_ROOT/levels/trigger/template"; }
track_start() {
  command -v node >/dev/null || { echo "node missing (brew install node)"; exit 1; }
  mkdir -p "$WG_TRIG"
  if [ ! -x "$WG_TRIG/node_modules/.bin/vitest" ] || ! cmp -s "$(_tmpl)/package-lock.json" "$WG_TRIG/package-lock.json"; then
    echo "installing node_modules into ${WG_TRIG} (once)…"
    cp "$(_tmpl)/package.json" "$(_tmpl)/package-lock.json" "$WG_TRIG/"
    (cd "$WG_TRIG" && npm ci --no-audit --no-fund >/dev/null 2>&1) || (cd "$WG_TRIG" && npm install --no-audit --no-fund >/dev/null)
  fi
  track_wipe; echo "play area: ${WG_APP}"
}
track_stop() { rm -rf "$WG_APP"; }
track_ready() { [ -x "$WG_TRIG/node_modules/.bin/vitest" ] && [ -x "$WG_TRIG/node_modules/.bin/tsc" ]; }
track_wipe() {
  rm -rf "$WG_APP"; mkdir -p "$WG_APP"
  cp -R "$(_tmpl)/." "$WG_APP/"
  ln -s ../node_modules "$WG_APP/node_modules"
}
track_shell() { cd "$WG_APP" && exec "${SHELL:-bash}"; }
