## 1
A foreign key is a column whose values must exist as ids in another table. It is declared on the column: `pet_id integer references pets (id)`.
## 2
Same shape as lesson 6, one more column with `references`: `create table visits (id integer primary key, pet_id integer references pets (id), reason text);`. `\d visits` shows a "Foreign-key constraints" line.
## 3
    create table visits (id integer primary key, pet_id integer references pets (id), reason text);
