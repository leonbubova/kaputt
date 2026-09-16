# linking tables — a foreign key
Lesson: real data lives in several tables that point at each other. A vet visit belongs to one pet, so the
visits table gets a column `pet_id` holding that pet's `id`. To make the database enforce that the pet really
exists, the column is declared with `references`:
    create table visits (id integer primary key, pet_id integer references pets (id), reason text);
That is a foreign key: `pet_id` may only hold a value that exists in `pets.id`. An insert with `pet_id = 999`
is refused with an error — and a pet with visits cannot be deleted. Bad links become impossible instead of silent.
Try it:
    wg shell
    create table toys (id integer primary key, pet_id integer references pets (id), name text);
    insert into toys (id, pet_id, name) values (1, 2, 'mouse');
    insert into toys (id, pet_id, name) values (2, 999, 'ghost');
The second insert fails: `violates foreign key constraint`. That error is the feature.
Your task: create a table `visits` with columns `id` integer primary key, `pet_id` integer that references `pets (id)`, and `reason` text.
Check yourself:  wg check      stuck?  wg hint
