## 1
A policy covers exactly one command. The read policy (`for select`) says nothing about INSERT, so without an insert policy every anonymous write is refused: `select policyname, cmd, roles from pg_policies where tablename='notes';`
## 2
For INSERT the row condition is written `with check (…)` instead of `using (…)`: it decides which *new* rows are accepted. `true` = any row.
## 3
`create policy "public write" on public.notes for insert to anon with check (true);` — test: `curl -s -X POST http://127.0.0.1:54321/rest/v1/notes -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"body":"hi"}' -w '%{http_code}'`
