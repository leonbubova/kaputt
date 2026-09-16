## 1
INSERT names the columns you fill and gives one value per column, in the same order. `id` fills itself — leave it out.
## 2
`insert into pets (name, species, age) values ('…', '…', …);` — name and species in single quotes, the age as a bare number.
## 3
    insert into pets (name, species, age) values ('Luna', 'cat', 2);
Then `select * from pets;` shows her as the last row.
