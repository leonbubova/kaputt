In `wg shell` (psql):
    create table public.hello (id bigint generated always as identity primary key, word text not null);
    insert into public.hello (word) values ('hi');
