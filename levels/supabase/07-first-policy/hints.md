## 1
A policy = label + command + role + row condition. For "anyone may read everything" that is: `for select`, `to anon`, `using (true)`.
## 2
`create policy "anyone can read" on public.fruits for select to anon using (true);` — one statement in psql. Then `select policyname, cmd, roles from pg_policies where tablename = 'fruits';` shows it.
## 3
    create policy "anyone can read" on public.fruits for select to anon using (true);
