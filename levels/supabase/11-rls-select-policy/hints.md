## 1
With RLS enabled and no policy, every role except the owner sees nothing — `200 []` is what "denied" looks like for SELECT. Look: `select * from pg_policies where tablename='notes';`
## 2
A policy = who (`to <role>`) + which command (`for select`) + which rows (`using (…)`). The anon key runs as role `anon`.
## 3
`create policy "public read" on public.notes for select to anon using (true);` — then `curl -s http://127.0.0.1:54321/rest/v1/notes -H "apikey: $ANON_KEY"` (keys: `cat ~/.k8s-wargame/supabase/env`).
