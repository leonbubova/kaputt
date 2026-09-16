source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
pets_fixture
sqlf <<'SQL' >/dev/null
create table public.vets (id serial primary key, name text not null, phone text);
create table public.visits (id serial primary key, pet_id integer not null references public.pets (id), vet_id integer references public.vets (id), reason text);
insert into public.vets (name, phone) values ('Dr. Vogel', '030 123456');
insert into public.visits (pet_id, vet_id, reason) values (1, 1, 'vaccination'), (4, 1, 'check-up');
SQL
rm -f "$ANSWER"
