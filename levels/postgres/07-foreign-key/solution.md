    create table visits (id integer primary key, pet_id integer references pets (id), reason text);
