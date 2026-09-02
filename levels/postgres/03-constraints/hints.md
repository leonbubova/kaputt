## 1
A constraint is a rule the database itself enforces on every insert and update — the app can't forget it. They live on the table and are added to an existing one with `ALTER TABLE users ADD CONSTRAINT name …`. `\d users` shows which exist (none yet).
## 2
Three kinds: `PRIMARY KEY (id)`, `UNIQUE (email)`, `CHECK (age >= 18)`. Each is one `alter table … add constraint`.
## 3
`alter table users add primary key (id); alter table users add unique (email); alter table users add check (age >= 18);`
