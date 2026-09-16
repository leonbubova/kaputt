## 1
`create table NAME (column type, column type, …);` — three columns here. The primary key is added right after the type of the id column: `id integer primary key`.
## 2
Types: `integer` for id, `text` for name and email. `\d owners` afterwards shows the columns and an "Indexes: owners_pkey" line — that is the primary key.
## 3
    create table owners (id integer primary key, name text, email text);
