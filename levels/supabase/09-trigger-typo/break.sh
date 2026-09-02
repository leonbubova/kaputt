source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.posts (id serial primary key, title text not null, slug text, body text);
alter table public.posts enable row level security;
create policy "read" on public.posts for select to anon, authenticated using (true);
create or replace function public.set_slug() returns trigger language plpgsql as $fn$
begin
  new.slug := lower(regexp_replace(trim(new.titel), '[^a-zA-Z0-9]+', '-', 'g'));
  return new;
end $fn$;
create trigger posts_set_slug before insert on public.posts for each row execute function public.set_slug();
SQL
