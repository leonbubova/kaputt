source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rm -f "$SB_DIR/fruits.json"
sqlf <<'SQL' >/dev/null
create table public.fruits (id bigint generated always as identity primary key, name text not null);
insert into public.fruits (name) values ('apple'), ('banana'), ('cherry');
SQL
# PostgREST caches the schema — tell it about the new table, then wait until the API serves it
sqlf <<'SQL' >/dev/null
select pg_notify('pgrst', 'reload schema');
SQL
sb_env; i=0; while [ $i -lt 20 ]; do curl -s -m 3 "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY" 2>/dev/null | grep -q apple && break; sleep 0.5; i=$((i+1)); done
