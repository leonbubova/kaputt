# with RLS on, a policy says who may do which command on which rows
Lesson: the REST API runs SQL as a database role — `anon` for the anon key, `authenticated` for a logged-in user. Row Level Security decides which rows those roles get to touch. The rule is simple: RLS enabled and no matching policy means zero rows. Not an error — for SELECT, denied looks like `200 []`.
A policy has three parts, in this order: who (`to anon`), which command (`for select`), which rows (`using (…)`, a boolean per row). `using (true)` means every row. You add one policy per role and command you want to permit; everything else stays closed. Turning RLS off instead would open INSERT, UPDATE and DELETE too.
    select policyname, roles, cmd, qual from pg_policies where tablename='notes';     the policies that exist
    create policy "name" on public.t for select to anon using (true);               who / command / rows
    source ~/.k8s-wargame/supabase/env                                              API_URL, ANON_KEY
    curl -s "$API_URL/rest/v1/notes" -H "apikey: $ANON_KEY"                         what the frontend sees
Try it first: run the `pg_policies` query in `wg shell` — no rows. That is the whole reason the frontend sees `[]`.
Your task: "`notes` has RLS enabled (good) and 3 rows. The public frontend uses the anon key and gets `[]` from `GET /rest/v1/notes`. Make notes readable for anonymous visitors — read only, RLS stays on."
Goal: anon GET returns the 3 rows; anon POST is still rejected.
Check yourself:  wg check      stuck?  wg hint
