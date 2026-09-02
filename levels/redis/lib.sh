# redis-track helpers — sourced after lib/common.sh (cwd = level dir)
RC=${WG_REDIS_C:-wg-redis}
R()  { docker exec "$RC" redis-cli "$@"; }              # run a redis-cli command
Rt() { docker exec "$RC" redis-cli type "$1"; }         # TYPE of a key
Rcfg() { docker exec "$RC" redis-cli config get "$1" | tail -1; }   # value of a CONFIG param
