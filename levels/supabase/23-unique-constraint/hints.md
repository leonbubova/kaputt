## 1
Only the database can guarantee "no two rows with the same email" — an app-side check races with itself. The guarantee is a `unique` constraint on the column: `\d public.waitlist` shows the ones that exist (only the primary key so far).
## 2
`alter table public.waitlist add constraint waitlist_email_key unique (email);` — Postgres backs it with a unique index and rejects the second row with `23505 duplicate key value`.
## 3
PostgREST turns that error into `409 Conflict`: `curl -s -o /dev/null -w '%{http_code}' -X POST http://127.0.0.1:54321/rest/v1/waitlist -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"email":"ana@example.com"}'`
