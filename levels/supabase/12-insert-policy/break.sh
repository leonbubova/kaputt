source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.notes (id bigint generated always as identity primary key, body text not null, created_at timestamptz not null default now());
alter table public.notes enable row level security;
create policy "public read" on public.notes for select to anon, authenticated using (true);
insert into public.notes (body) values ('buy milk'), ('ship v2'), ('write postmortem');
SQL
