source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(*) from pg_publication where pubname='supabase_realtime'")" = 1 ] || fail "publication supabase_realtime is gone"
[ "$(sql "select count(*) from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='rooms'")" = 1 ] || fail "rooms is not in publication supabase_realtime"
ok "rooms is published to realtime"
