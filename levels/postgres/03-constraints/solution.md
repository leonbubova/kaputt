    alter table users add primary key (id), add unique (email), add check (age >= 18);
