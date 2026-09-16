## 1
UPDATE sets a column to a new value in the rows the WHERE picks. Pick Bella by her name: `where name = 'Bella'`.
## 2
`update pets set age = 6 where name = 'Bella';` — check the answer line says `UPDATE 1`. If it said `UPDATE 7`, the WHERE was missing: `wg reset` and try again.
## 3
    update pets set age = 6 where name = 'Bella';
    select * from pets;
