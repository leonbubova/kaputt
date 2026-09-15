source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.players (id serial primary key, name text not null, score int not null default 0, banned boolean not null default false);
alter table public.players enable row level security;
create policy "read" on public.players for select to anon, authenticated using (true);
insert into public.players (name, score, banned) values ('mo', 420, false), ('kim', 910, false), ('cheater', 99999, true), ('ali', 610, false);
SQL
