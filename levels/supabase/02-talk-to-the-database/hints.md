## 1
`wg shell` puts you at the psql prompt (`postgres=#`). Everything you type there is SQL; a statement runs when you end it with `;` and press Enter.
## 2
Two statements: `create table public.hello (…)` with columns `id` and `word`, then `insert into public.hello (word) values ('hi');`. Text in SQL uses single quotes.
## 3
    create table public.hello (id bigint generated always as identity primary key, word text not null);
    insert into public.hello (word) values ('hi');
