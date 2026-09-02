# shared helpers for the supabase track — sourced by break.sh / check.sh / track.sh
# Bash 3.2 compatible.
SB_DIR=${SB_DIR:-$HOME/.k8s-wargame/supabase}
SB_PROJECT="$SB_DIR/project"
SB_ENV="$SB_DIR/env"
SB_DBC="supabase_db_project"      # db container (project_id = "project")
ok()   { printf '\033[32m✔ %s\033[0m\n' "$*"; }
fail() { printf '\033[31m✘ %s\033[0m\n' "$*"; exit 1; }
info() { printf '\033[2m  %s\033[0m\n' "$*"; }

# load API_URL / ANON_KEY / SERVICE_ROLE_KEY / DB_URL (written by track_start)
sb_env() {
  [ -f "$SB_ENV" ] || sb_write_env
  # shellcheck disable=SC1090
  . "$SB_ENV"
  [ -n "${API_URL:-}" ] && [ -n "${ANON_KEY:-}" ] || { echo "supabase env missing — wg start" >&2; return 1; }
}
sb_write_env() { (cd "$SB_PROJECT" && supabase status -o env 2>/dev/null) | grep -E '^(API_URL|ANON_KEY|SERVICE_ROLE_KEY|DB_URL|PUBLISHABLE_KEY|SECRET_KEY)=' > "$SB_ENV"; }

# run SQL as role postgres. sql "stmt"  |  sql < file  |  sql -f file
# -qAt: quiet, unaligned, tuples only. Fails on first error.
sql() {
  if [ $# -eq 1 ] && [ "${1#-}" = "$1" ]; then set -- -c "$1"; fi
  if command -v psql >/dev/null 2>&1; then
    sb_env; psql "$DB_URL" -X -v ON_ERROR_STOP=1 -qAt "$@"
  else
    docker exec -i "$SB_DBC" psql -U postgres -d postgres -X -v ON_ERROR_STOP=1 -qAt "$@"
  fi
}
# sqlf < stdin : run a multi-statement script from stdin
sqlf() { sql -f -; }

# REST helpers. rest_anon METHOD PATH [curl args…]  → prints body; status via $(rest_code)
# (callers use body=$(rest_anon …) — a subshell — so the code goes through a file, not a variable)
REST_CODE_FILE=${TMPDIR:-/tmp}/wg-rest-code.$$
rest_code() { cat "$REST_CODE_FILE" 2>/dev/null || echo 000; }
rest() { # key method path [curl args]
  local key=$1 method=$2 path=$3; shift 3; local out
  out=$(curl -s -m 10 -w '\n%{http_code}' -X "$method" "$API_URL$path" -H "apikey: $key" -H "Authorization: Bearer $key" "$@") || { echo 000 > "$REST_CODE_FILE"; return 1; }
  echo "${out##*$'\n'}" > "$REST_CODE_FILE"; printf '%s' "${out%$'\n'*}"
}
rest_anon() { sb_env; rest "$ANON_KEY" "$@"; }
rest_svc()  { sb_env; rest "$SERVICE_ROLE_KEY" "$@"; }

# count top-level objects in a JSON array (no jq dependency): counts `{` at depth 1
json_len() { printf '%s' "$1" | tr -d ' \n' | awk 'BEGIN{d=0;n=0}{for(i=1;i<=length($0);i++){c=substr($0,i,1); if(c=="{"){d++; if(d==1)n++} else if(c=="}")d--}} END{print n}'; }

# retry CMD until exit 0 (PostgREST schema cache reload etc.). retry SECONDS cmd…
retry() { local t=$1 i=0; shift; [ -n "${WG_FAST:-}" ] && t=4; while [ $i -lt "$t" ]; do "$@" && return 0; sleep 1; i=$((i+1)); done; return 1; }

rls_on() { [ "$(sql "select relrowsecurity from pg_class where oid='public.$1'::regclass")" = t ]; }

# wait until the db is accepting connections AND storage-api has (re)created its
# schema tables. `supabase db reset` restarts every container, so right after it
# the db and the storage.objects/buckets tables are briefly absent; callers that
# reset (or the per-level wipe) must wait for them or the next statement fails.
sb_wait_ready() { # [timeout-seconds, default 90]
  local t=${1:-90} i=0
  while [ $i -lt "$t" ]; do
    if docker exec "$SB_DBC" pg_isready -U postgres >/dev/null 2>&1 &&
       [ "$(docker exec "$SB_DBC" psql -U postgres -tAc "select to_regclass('storage.objects') is not null" 2>/dev/null)" = t ]; then
      return 0
    fi
    sleep 1; i=$((i+1))
  done
  return 1
}
