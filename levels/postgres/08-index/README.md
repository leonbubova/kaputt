# finding rows fast — an index
Lesson: with 7 pets, `where name = 'Nala'` is instant: Postgres reads all rows and keeps the match. With
7 million rows that same read-everything takes seconds. An index is a sorted lookup structure on one column,
like the index at the back of a book — Postgres jumps straight to the matching rows instead of reading them all.
    create index pets_species_idx on pets (species);
The name (`pets_species_idx`) is yours to choose; the convention is table_column_idx. `\d pets` lists the
indexes of a table at the bottom; `\di` lists all of them. The primary key you met in lesson 6 is an index too —
that is why looking up a row by id is always fast.
Try it:
    wg shell
    \d pets
    create index pets_species_idx on pets (species);
    \d pets
Your task: queries by name are the most common. Create an index on the column `name` of `pets`.
Check yourself:  wg check      stuck?  wg hint
