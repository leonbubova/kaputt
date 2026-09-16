In psql (`wg shell`):
    create policy "anyone can read" on public.fruits for select to anon using (true);
