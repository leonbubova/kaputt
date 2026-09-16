source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rm -f "$SB_DIR/fruits.json"
sqlf <<'SQL' >/dev/null
create table public.fruits (id bigint generated always as identity primary key, name text not null);
insert into public.fruits (name) values ('apple'), ('banana'), ('cherry');
SQL
