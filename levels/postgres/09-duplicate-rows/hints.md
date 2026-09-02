## 1
Find them: `select email, count(*) from subscribers group by email having count(*) > 1;` Two jobs, in order: remove the extras, then make the DB enforce uniqueness.
## 2
Delete the later copies: `delete from subscribers a using subscribers b where a.email = b.email and a.id > b.id;` A UNIQUE constraint can't be added while duplicates exist.
## 3
`alter table subscribers add constraint subscribers_email_key unique (email);` — the next duplicate insert fails with `23505`.
