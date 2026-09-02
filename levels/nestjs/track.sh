# track: NestJS app on the host (node ≥ 20). Play area: ~/.k8s-wargame/nestjs/app
NEST_HOME=$HOME/.k8s-wargame/nestjs
NEST_APP=$NEST_HOME/app
NEST_TPL=$WG_ROOT/levels/nestjs/template
nest_kill_port() { local p; p=$(lsof -ti "tcp:$1" 2>/dev/null || true); [ -n "$p" ] && kill -9 $p 2>/dev/null; return 0; }
track_start() {
  if ! command -v node >/dev/null 2>&1; then
    command -v brew >/dev/null 2>&1 && brew install node || { echo "node missing — install node ≥ 20" >&2; exit 1; }
  fi
  local major; major=$(node -v | sed 's/^v//' | cut -d. -f1)
  [ "$major" -ge 20 ] || { echo "node ≥ 20 required, found $(node -v)" >&2; exit 1; }
  mkdir -p "$NEST_HOME"; cp "$NEST_TPL/package.json" "$NEST_HOME/package.json"
  cp "$NEST_TPL/package-lock.json" "$NEST_HOME/package-lock.json" 2>/dev/null || true
  if ! cmp -s "$NEST_HOME/package.json" "$NEST_HOME/node_modules/.wg-package.json" 2>/dev/null; then
    echo "installing node_modules (once)…"
    (cd "$NEST_HOME" && npm install --no-audit --no-fund >/dev/null) || { echo "npm install failed" >&2; exit 1; }
    cp "$NEST_HOME/package.json" "$NEST_HOME/node_modules/.wg-package.json"
  fi
  track_wipe
  cat "$WG_ROOT/levels/nestjs/README.md"
}
track_stop() { nest_kill_port 3200; nest_kill_port 3299; rm -rf "$NEST_APP"; echo "stopped (node_modules kept in $NEST_HOME)"; }
track_ready() { command -v node >/dev/null 2>&1 && [ -d "$NEST_HOME/node_modules/@nestjs/core" ]; }
track_wipe() {  # before each level: fresh copy of the template, shared node_modules
  nest_kill_port 3200; nest_kill_port 3299
  rm -rf "$NEST_APP"; cp -R "$NEST_TPL" "$NEST_APP"; ln -s ../node_modules "$NEST_APP/node_modules"
}
track_shell() { cd "$NEST_APP" && exec "${SHELL:-bash}"; }
