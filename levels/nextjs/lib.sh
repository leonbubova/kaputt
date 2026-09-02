# helpers for nextjs levels — sourced by break.sh / check.sh (after lib/common.sh)
WG_NEXT=$HOME/.k8s-wargame/nextjs; APP=$WG_NEXT/app; CHK=$WG_NEXT/check; TPL=$WG_ROOT/levels/nextjs/template
PORT=3199; export NEXT_TELEMETRY_DISABLED=1
_kill_port() { local pids i=0; pids=$(lsof -ti tcp:"$1" 2>/dev/null || true); [ -n "$pids" ] && kill -9 $pids 2>/dev/null || true
  while [ -n "$(lsof -ti tcp:"$1" 2>/dev/null || true)" ] && [ $i -lt 20 ]; do sleep 0.3; i=$((i+1)); done; }
# copy the play area (without node_modules/.next) so the check never touches the player's dev server
snapshot() {
  rm -rf "$CHK"; mkdir -p "$CHK"
  rsync -a --exclude node_modules --exclude .next "$APP/" "$CHK/"
  ln -s ../node_modules "$CHK/node_modules"; cd "$CHK"
}
_dev_down() { [ -n "${DEV_PID:-}" ] && kill "$DEV_PID" 2>/dev/null; _kill_port $PORT; }
dev_up() {   # start a dev server on $PORT inside the snapshot
  _kill_port $PORT; trap _dev_down EXIT
  node_modules/.bin/next dev -p $PORT > "$CHK/dev.log" 2>&1 & DEV_PID=$!
  local t=40 i=0; [ -n "${WG_FAST:-}" ] && t=25
  while [ $i -lt $t ]; do curl -s -o /dev/null "http://localhost:$PORT/api/health" && return 0; kill -0 $DEV_PID 2>/dev/null || break; sleep 1; i=$((i+1)); done
  # server up but /api/health may itself be broken: accept any http answer
  curl -s -o /dev/null "http://localhost:$PORT/" && return 0
  fail "dev server did not start (see $CHK/dev.log)"
}
get() {      # path → CODE, LOC, BODY (file)
  BODY=$CHK/body; CODE=$(curl -s -m 30 -o "$BODY" -w '%{http_code}|%{redirect_url}' "http://localhost:$PORT$1")
  LOC=${CODE#*|}; CODE=${CODE%%|*}
}
server_error() { grep -m1 '⨯' "$CHK/dev.log" | cut -c1-200 | sed 's/^/  server: /' >&2 || true; }
want() { [ "$CODE" = "$1" ] || { server_error; fail "$2 answered $CODE (want $1)"; }; }
body_has() { grep -q -- "$1" "$BODY" || { server_error; fail "$2"; }; }
build() {    # production build inside the snapshot
  node_modules/.bin/next build > "$CHK/build.log" 2>&1 || { grep -m3 -iE 'error|⨯' "$CHK/build.log" | sed 's/^/  build: /' >&2; fail "next build failed"; }
}
typecheck() { node_modules/.bin/tsc --noEmit > "$CHK/tsc.log" 2>&1 || { head -3 "$CHK/tsc.log" | sed 's/^/  tsc: /' >&2; fail "tsc --noEmit failed"; }; }
