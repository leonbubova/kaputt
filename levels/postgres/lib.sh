# shared helpers for the postgres track — sourced by break.sh / check.sh / track.sh. Bash 3.2 compatible.
PGC=wg-pg                                  # container
PGPW=wg                                    # POSTGRES_PASSWORD
PGPORT_HOST=5433
WG_PG_DIR=${WG_PG_DIR:-$HOME/.k8s-wargame/postgres}   # files the player edits (query.sql, seed.sql, migrations/)
QUERY=$WG_PG_DIR/query.sql
PG_URL="postgres://postgres:$PGPW@localhost:$PGPORT_HOST/wg"
ok()   { printf '\033[32m✔ %s\033[0m\n' "$*"; }
fail() { printf '\033[31m✘ %s\033[0m\n' "$*"; exit 1; }
info() { printf '\033[2m  %s\033[0m\n' "$*"; }
# run SQL in the container as postgres (or PGROLE) on db wg (or PGDB). sql "stmt" | sql < file | sql -f -
# -qAt: quiet, unaligned, tuples only. Fails on first error.
sql() {
  if [ $# -eq 1 ] && [ "${1#-}" = "$1" ]; then set -- -c "$1"; fi
  docker exec -i "$PGC" psql -U "${PGROLE:-postgres}" -d "${PGDB:-wg}" -X -v ON_ERROR_STOP=1 -qAt "$@"
}
sqlf() { sql -f -; }                       # multi-statement script from stdin
sqlq() { [ -s "$QUERY" ] || return 1; sql -f - < "$QUERY"; }   # run the player's query.sql
col_type() { sql "select data_type from information_schema.columns where table_schema='public' and table_name='$1' and column_name='$2'"; }
has_table() { [ "$(sql "select count(*) from pg_tables where schemaname='public' and tablename='$1'")" = 1 ]; }
# constraint of type p/u/f/c on table (any name)
has_constraint() { [ "$(sql "select count(*) from pg_constraint where conrelid='public.$1'::regclass and contype='$2'")" -ge 1 ]; }
# does the statement fail? (expected for constraint tests)
rejects() { ! sql "$1" >/dev/null 2>&1; }
