source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.notes (id bigint generated always as identity primary key, body text not null, created_at timestamptz not null default now());
alter table public.notes enable row level security;
insert into public.notes (body) values ('buy milk'), ('ship v2'), ('write postmortem');
SQL
