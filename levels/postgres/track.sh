# track: one postgres container on the host docker daemon — wg-pg, port 5433, db wg
source "$WG_ROOT/levels/postgres/lib.sh"
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker daemon not reachable — start colima/docker" >&2; return 1; }
  if ! docker inspect -f '{{.State.Running}}' "$PGC" 2>/dev/null | grep -q true; then
    docker rm -f "$PGC" >/dev/null 2>&1 || true
    echo "pulling postgres:16-alpine…"; docker pull -q postgres:16-alpine >/dev/null
    docker run -d --name "$PGC" -e POSTGRES_PASSWORD="$PGPW" -p "$PGPORT_HOST:5432" postgres:16-alpine >/dev/null
  fi
  local i=0; until docker exec "$PGC" pg_isready -U postgres -q 2>/dev/null; do sleep 1; i=$((i+1)); [ $i -gt 60 ] && { echo "postgres did not come up" >&2; return 1; }; done
  sleep 1; mkdir -p "$WG_PG_DIR"
  echo "connect: psql $PG_URL"
  command -v psql >/dev/null 2>&1 || echo "no psql on host — use: docker exec -it $PGC psql -U postgres -d wg   (or: wg shell)"
  echo "files:   $WG_PG_DIR"
}
track_stop()  { docker rm -f "$PGC" >/dev/null 2>&1 || true; rm -rf "$WG_PG_DIR"; }
track_ready() { docker exec "$PGC" pg_isready -U postgres -q >/dev/null 2>&1; }
track_wipe() {  # before each level: fresh database wg, no wg_ roles, empty files dir
  PGDB=postgres sqlf <<'SQL' >/dev/null
set client_min_messages = warning;
drop database if exists wg with (force);
drop database if exists wg_scratch with (force);
drop role if exists wg_reporter; drop role if exists wg_app;
create database wg;
SQL
  rm -rf "$WG_PG_DIR"; mkdir -p "$WG_PG_DIR"
}
track_shell() { docker exec -it "$PGC" psql -U postgres -d wg; }
