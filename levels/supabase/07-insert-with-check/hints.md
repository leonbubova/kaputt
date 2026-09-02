## 1
For INSERT, the relevant clause is `WITH CHECK`. Show it: `select policyname, cmd, roles, with_check from pg_policies where tablename='guestbook';`
## 2
`auth.uid()` is NULL for anonymous requests, and `NULL = anything` is never true — so the check rejects every anonymous row. Copy-pasted from a "users own their rows" example.
## 3
`alter policy "sign the book" on public.guestbook with check (true);` (or `with check (author_id is null)` if you want to be strict).
