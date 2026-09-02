# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/redis/lib.sh"
s01(){ R SET app:name shop >/dev/null; }
s02(){ R HSET user:1 name anna age 30 >/dev/null; }
s03(){ R RPUSH queue:jobs build test deploy >/dev/null; }
s04(){ R SET session:abc token123 EX 300 >/dev/null; }
s05(){ R SET audit:legacy:type "$(Rt legacy:blob)" >/dev/null; }
s06(){ R DEL events >/dev/null; R RPUSH events signup login >/dev/null; }
s07(){ local k; for k in session:a session:b session:c; do [ "$(R TTL "$k")" = -1 ] && R DEL "$k" >/dev/null; done; return 0; }
s08(){ R EXPIRE session:live 3600 >/dev/null; }
s09(){ R INCR deploy:count >/dev/null; }
s10(){ R SET page:views 1000 >/dev/null; }
s11(){ R SET audit:maxclients "$(Rcfg maxclients)" >/dev/null; }
s12(){ R CONFIG SET maxmemory-policy allkeys-lru >/dev/null; }
s13(){ local k; for k in $(R KEYS 'tmp:*'); do R DEL "$k" >/dev/null; done; }
s14(){ R RENAME catalog:v1 catalog >/dev/null; }
s15(){ R SADD roles admin editor viewer >/dev/null; }
s16(){ R DEL tags >/dev/null; R SADD tags red green blue >/dev/null; }
s17(){ R CONFIG SET appendonly yes >/dev/null; }
s18(){ R DEL cache:home >/dev/null; R SET cache:home '<html>home</html>' EX 300 >/dev/null; }
