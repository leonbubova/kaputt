source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.waitlist (id serial primary key, email text not null, created_at timestamptz not null default now());
alter table public.waitlist enable row level security;
create policy "join" on public.waitlist for insert to anon, authenticated with check (true);
insert into public.waitlist (email) values ('ana@example.com'), ('ben@example.com'), ('cleo@example.com');
SQL
