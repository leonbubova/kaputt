## 1
Two jobs, in order: remove the duplicates, then make the database enforce uniqueness. Find them: `select email, count(*) from subscribers group by 1 having count(*) > 1;`
## 2
Dedupe keeping the earliest row: `delete from subscribers a using subscribers b where a.email = b.email and a.id > b.id;` (a unique constraint cannot be added while duplicates exist).
## 3
`alter table public.subscribers add constraint subscribers_email_key unique (email);` — PostgREST turns the violation into `409 Conflict`.
