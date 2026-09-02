source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.customers cascade;
create table public.customers (id serial primary key, name text not null, nickname text);
insert into public.customers (name, nickname) values ('Anna', 'Annie'), ('Ben', null), ('Cara', 'CC'), ('Dan', null);
SQL
printf 'select id, nickname as display from customers order by id;\n' > "$QUERY"
