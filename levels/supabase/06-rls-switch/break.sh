source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.secrets (id bigint generated always as identity primary key, secret text not null);
insert into public.secrets (secret) values ('the cake is real'), ('admin password is hunter2');
SQL
