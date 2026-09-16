## 1
An index is created on one column of one table: `create index SOMENAME on TABLE (COLUMN);`. The column here is `name`.
## 2
Pick the conventional name: `pets_name_idx`. Afterwards `\d pets` lists it under "Indexes:".
## 3
    create index pets_name_idx on pets (name);
