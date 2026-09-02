# track: Next.js 15 App Router app on the host (node, no containers)
WG_NEXT=$HOME/.k8s-wargame/nextjs          # node_modules installed once here
WG_APP=$WG_NEXT/app                        # the play area (copied from template per level)
WG_TPL=$WG_ROOT/levels/nextjs/template
export NEXT_TELEMETRY_DISABLED=1

_kill_port() { local pids; pids=$(lsof -ti tcp:"$1" 2>/dev/null || true); [ -n "$pids" ] && kill $pids 2>/dev/null || true; }
_node_ok() { command -v node >/dev/null 2>&1 && [ "$(node -v | sed 's/^v//; s/\..*//')" -ge 20 ]; }

track_start() {
  if ! _node_ok; then
    echo "node ≥ 20 missing — installing via brew…"; command -v brew >/dev/null || { echo "no brew; install node 20+ yourself" >&2; return 1; }
    brew install node >/dev/null
  fi
  mkdir -p "$WG_NEXT"
  if [ ! -f "$WG_NEXT/node_modules/next/package.json" ] || ! cmp -s "$WG_TPL/package-lock.json" "$WG_NEXT/package-lock.json"; then
    echo "installing node_modules into $WG_NEXT (once)…"
    cp "$WG_TPL/package.json" "$WG_TPL/package-lock.json" "$WG_NEXT/"
    (cd "$WG_NEXT" && npm ci --no-audit --no-fund >/dev/null 2>&1) || (cd "$WG_NEXT" && npm install --no-audit --no-fund >/dev/null)
  else echo "node_modules present"; fi
  track_wipe
  echo "app: $WG_APP   (npm run dev → http://localhost:3100)"
}
track_stop() { _kill_port 3100; _kill_port 3199; rm -rf "$WG_APP" "$WG_NEXT/check"; }
track_ready() { _node_ok && [ -f "$WG_NEXT/node_modules/next/package.json" ]; }
track_wipe() {  # before each level: fresh copy of the template, leftover servers killed
  _kill_port 3100; _kill_port 3199
  rm -rf "$WG_APP" "$WG_NEXT/check"
  cp -R "$WG_TPL" "$WG_APP"; rm -f "$WG_APP/package-lock.json"
  ln -s ../node_modules "$WG_APP/node_modules"
}
track_shell() { echo "→ $WG_APP  (exit to return)"; (cd "$WG_APP" && exec "${SHELL:-bash}"); }
