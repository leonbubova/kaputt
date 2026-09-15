## 1
RLS has two gates: `USING` filters the rows you may see, `WITH CHECK` decides which new rows you may write. A 403 on INSERT means the row failed the insert policy's `WITH CHECK` — the policy exists, its condition just isn't true for anonymous rows. Show it: `select policyname, cmd, roles, with_check from pg_policies where tablename='guestbook';`
## 2
`auth.uid()` is NULL for anonymous requests, and `NULL = anything` is never true — so the check rejects every anonymous row. Copy-pasted from a "users own their rows" example.
## 3
`alter policy "sign the book" on public.guestbook with check (true);` (or `with check (author_id is null)` if you want to be strict).
