source ../../../lib/common.sh; source ../lib.sh
[ "$(Rcfg maxmemory-policy)" = allkeys-lru ] || fail "maxmemory-policy is $(Rcfg maxmemory-policy), want allkeys-lru"
ok "eviction policy is allkeys-lru"
