source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.products (id serial primary key, name text not null, price_cents int not null);
alter table public.products enable row level security;
create policy "catalog is public" on public.products for select to anon, authenticated using (true);
insert into public.products (name, price_cents) values ('mug', 1200), ('hoodie', 4500), ('sticker pack', 500);
-- "hardening" script
revoke all on table public.products from anon, authenticated;
SQL
