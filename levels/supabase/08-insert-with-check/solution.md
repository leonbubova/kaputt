Insert policy has `with check (auth.uid() = author_id)` — always false for anon (uid is NULL).
    alter policy "sign the book" on public.guestbook with check (true);
