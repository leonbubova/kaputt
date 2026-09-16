# opening a door: a policy
Lesson: with RLS on, a table is closed. A policy opens it a little: it says WHO may do WHICH command on WHICH rows.
    create policy "NAME" on public.T for select to anon using (true);
      "NAME"           any text, in double quotes — a label for this rule
      for select       the command it covers: select (read), insert, update or delete — one per policy
      to anon          the role: `anon` is what the anon key acts as
      using (true)     the row condition — `true` means every row
Several policies can exist on one table; RLS stays on. You can list them:
    select policyname, cmd, roles from pg_policies where tablename = 'fruits';
Try it — `public.fruits` has 3 rows and RLS on, no policy yet. The API gets `[]`:
    source ~/.k8s-wargame/supabase/env
    curl -s "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY"
Your task: in psql (`wg shell`) create a policy named `anyone can read` on `public.fruits` that lets role `anon`
read every row. Afterwards the curl above prints the 3 fruits. RLS stays on; nothing else changes.
Check yourself:  wg check      stuck?  wg hint
