# helpers for nestjs levels — source "$WG_ROOT/levels/nestjs/nest.sh"
source "$WG_ROOT/lib/common.sh"
APP=$HOME/.k8s-wargame/nestjs/app
LOG=$HOME/.k8s-wargame/nestjs/check.log
PORT=3299                      # check boots its own instance here; the player's dev server on 3200 is left alone
BASE=http://localhost:$PORT
APP_PID=
app_kill() { [ -n "$APP_PID" ] && kill "$APP_PID" 2>/dev/null; local p; p=$(lsof -ti "tcp:$PORT" 2>/dev/null || true); [ -n "$p" ] && kill -9 $p 2>/dev/null; return 0; }
# boot the app from $APP with ts-node; returns 1 if it crashes or is not listening in time
app_start() {
  app_kill; trap app_kill EXIT
  local t=30; [ -n "${WG_FAST:-}" ] && t=15
  (cd "$APP" && unset API_KEY && PORT=$PORT exec ./node_modules/.bin/ts-node --transpile-only src/main.ts) >"$LOG" 2>&1 &
  APP_PID=$!; disown $APP_PID 2>/dev/null || true
  local i=0; while [ $i -lt $((t*2)) ]; do
    curl -s -m 2 -o /dev/null "$BASE/" && return 0
    kill -0 "$APP_PID" 2>/dev/null || return 1
    sleep 0.5; i=$((i+1))
  done; return 1
}
boot_or_fail() { app_start || { info "$(grep -m1 -E 'Error|error' "$LOG" | cut -c1-160)"; fail "app does not start (npm run start:dev, log: $LOG)"; }; }
get()    { curl -s -m 5 "$BASE$1"; }
code()   { curl -s -m 5 -o /dev/null -w '%{http_code}' "$@"; }
post()   { curl -s -m 5 -H 'content-type: application/json' -X POST -d "$2" "$BASE$1"; }
