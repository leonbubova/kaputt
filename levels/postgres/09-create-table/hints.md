## 1
A table is a fixed set of named, typed columns — you declare it once with `CREATE TABLE name (column type, …);`, rows come later. Connect first: `psql postgres://postgres:wg@localhost:5433/wg`. `\dt` lists tables — there are none.
## 2
Types: whole numbers → `integer`, free text → `text`, a point in time → `timestamptz` (short for `timestamp with time zone`). `\d customers` shows what you built.
## 3
`create table customers (id integer, name text, email text, created_at timestamptz);`
