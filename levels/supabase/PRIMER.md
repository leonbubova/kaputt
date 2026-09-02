# supabase — the commands you'll actually use
Project: ~/.k8s-wargame/supabase/project. Keys: `source ~/.k8s-wargame/supabase/env` (API_URL, ANON_KEY, SERVICE_ROLE_KEY, DB_URL). Studio: http://127.0.0.1:54323.

  wg shell                                    psql as postgres (= docker exec -it supabase_db_project psql -U postgres)
  \d table   \dp table   \sf fn   \dv *.*     describe / GRANTs / function body / views in every schema   (psql)
  select * from pg_policies where tablename='x';      the RLS policies: roles, cmd, using, with_check
  supabase migration new name                 → supabase/migrations/<ts>_name.sql; then `supabase migration up` (applies pending files)
  supabase db reset                           rebuild from ALL migrations + seed.sql (~45 s) — what CI runs
  supabase stop && supabase start             config.toml is only read at start (auth settings, [api] schemas)
  curl -s "$API_URL/rest/v1/notes" -H "apikey: $ANON_KEY"      the frontend's view of a table — as role `anon`
  curl -s -X POST "$API_URL/rest/v1/rpc/fn" -H "apikey: $ANON_KEY" -H 'Content-Type: application/json' -d '{…}'    call a function
  create policy "p" on t for select to anon using (true);      who / which command / which rows (insert → `with check`)
  grant select on table t to anon, authenticated;              privileges come BEFORE policies (42501 = missing grant)
  notify pgrst, 'reload schema';              PostgREST 404s something that exists? refresh its cache

Mental model: the REST API is PostgREST running SQL as role `anon` (anon key) or `authenticated` (user JWT), only over schemas in `[api] schemas` (public). A request passes three layers in order: schema exposed → GRANT on the table → RLS policy for that role + command. `200 []` is what "denied by RLS" looks like; `42501` is a missing GRANT; `404` is the wrong schema or a stale cache.
