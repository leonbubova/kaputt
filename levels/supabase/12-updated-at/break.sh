source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.tasks (id serial primary key, title text not null, done boolean default false,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now());
alter table public.tasks enable row level security;
create policy "read" on public.tasks for select to anon, authenticated using (true);
create or replace function public.set_updated_at() returns trigger language plpgsql as $fn$
begin new.updated_at := now(); return new; end $fn$;
create trigger tasks_updated_at after update on public.tasks for each row execute function public.set_updated_at();
insert into public.tasks (title, created_at, updated_at) values
 ('rotate certs', '2024-01-10 09:00+00', '2024-01-10 09:00+00'),
 ('upgrade postgres', '2024-01-11 09:00+00', '2024-01-11 09:00+00');
SQL
