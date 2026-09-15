source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.guestbook (id serial primary key, name text not null, message text not null, author_id uuid, created_at timestamptz default now());
alter table public.guestbook enable row level security;
create policy "read all" on public.guestbook for select to anon, authenticated using (true);
create policy "sign the book" on public.guestbook for insert to anon, authenticated with check (auth.uid() = author_id);
insert into public.guestbook (name, message) values ('mo', 'first!');
SQL
