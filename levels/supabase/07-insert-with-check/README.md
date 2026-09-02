# USING filters rows you read, WITH CHECK judges rows you write
Lesson: RLS has two gates. `using (…)` is evaluated against existing rows and decides what SELECT, UPDATE and DELETE get to see. `with check (…)` is evaluated against the new row and decides whether INSERT (or the updated version of a row) is allowed to exist. An insert policy only has the second gate.
When WITH CHECK is false for a row, Postgres refuses it — that is the `403 new row violates row-level security policy`. The policy exists; the condition is just not true for the row being written.
The common trap: `auth.uid()` returns the user id from the JWT — and NULL for an anonymous request. In SQL, `NULL = anything` is not false, it is NULL, and a NULL check fails. A "users own their rows" condition therefore rejects every anonymous write.
    select policyname, cmd, roles, with_check from pg_policies where tablename='guestbook';     the write gate
    alter policy "name" on public.t with check (expr);                                          change only the write gate
    select auth.uid();                                                                          NULL in wg shell too
Try it first: `select null = null, (null = null) is null;` — false? no: NULL, and NULL does not pass a check.
Your task: "Reading works. But `POST /rest/v1/guestbook` with `{"name":"…","message":"…"}` and the anon key answers `403 new row violates row-level security policy`. There is an insert policy!"
Goal: anonymous visitors can insert; they still must not be able to delete anything. RLS stays on.
Check yourself:  wg check      stuck?  wg hint
