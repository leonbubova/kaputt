# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/redis/lib.sh"
s01(){ R SET greeting hello >/dev/null; }
s02(){ R DEL color:old >/dev/null; }
s03(){ R SET note:temp bye EX 600 >/dev/null; }
s04(){ R HSET pet:1 name rex kind dog >/dev/null; }
s05(){ R LPOP inbox >/dev/null; R RPUSH inbox mail4 >/dev/null; }
s06(){ R SET answer:list "$(for k in thing:a thing:b thing:c; do [ "$(Rt "$k")" = list ] && echo "$k"; done)" >/dev/null; }
s07(){ local cur=0 k out; while :; do out=$(R SCAN "$cur" MATCH 'note:*' COUNT 500); cur=$(echo "$out" | sed -n 1p | tr -d '\r'); k=$(echo "$out" | sed -n 2p | tr -d '\r'); [ -n "$k" ] && break; [ "$cur" = 0 ] && return 1; done; R SET found "$(R GET "$k")" >/dev/null; }
s08(){ R SET audit:maxmemory "$(R INFO memory | tr -d '\r' | awk -F: '$1=="maxmemory"{print $2}')" >/dev/null; }
s09(){ R SET app:name shop >/dev/null; }
s10(){ R HSET user:1 name anna age 30 >/dev/null; }
s11(){ R RPUSH queue:jobs build test deploy >/dev/null; }
s12(){ R SET session:abc token123 EX 300 >/dev/null; }
s13(){ R SET audit:legacy:type "$(Rt legacy:blob)" >/dev/null; }
s14(){ R DEL events >/dev/null; R RPUSH events signup login >/dev/null; }
s15(){ local k; for k in session:a session:b session:c; do [ "$(R TTL "$k")" = -1 ] && R DEL "$k" >/dev/null; done; return 0; }
s16(){ R EXPIRE session:live 3600 >/dev/null; }
s17(){ R INCR deploy:count >/dev/null; }
s18(){ R SET page:views 1000 >/dev/null; }
s19(){ R SET audit:maxclients "$(Rcfg maxclients)" >/dev/null; }
s20(){ R CONFIG SET maxmemory-policy allkeys-lru >/dev/null; }
s21(){ local k; for k in $(R KEYS 'tmp:*'); do R DEL "$k" >/dev/null; done; }
s22(){ R RENAME catalog:v1 catalog >/dev/null; }
s23(){ R SADD roles admin editor viewer >/dev/null; }
s24(){ R DEL tags >/dev/null; R SADD tags red green blue >/dev/null; }
s25(){ R CONFIG SET appendonly yes >/dev/null; }
s26(){ R DEL cache:home >/dev/null; R SET cache:home '<html>home</html>' EX 300 >/dev/null; }
