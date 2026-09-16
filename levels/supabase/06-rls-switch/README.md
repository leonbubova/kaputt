# the safety switch: row level security
Lesson: the anon key is public — it sits in every visitor's browser. So by default anyone could read (and write)
every table through the API. Postgres has a switch per table against that: row level security, RLS.
    RLS off    the API sees and changes every row                (dangerous for real data)
    RLS on     the API sees nothing — until a policy says which rows are allowed (next lesson)
    alter table public.T enable row level security;      switch on
    alter table public.T disable row level security;     switch off
Important: RLS on with no policy does not give an error. The API answers `200` with an empty list `[]`. Remember that shape.
Try it — `public.secrets` exists with 2 rows and RLS off:
    source ~/.k8s-wargame/supabase/env
    curl -s "$API_URL/rest/v1/secrets" -H "apikey: $ANON_KEY"
Anyone with the anon key can read the secrets. Not good.
Your task: switch RLS on for `public.secrets` (in psql, `wg shell`). Afterwards the same curl must print `[]`.
Do not delete the rows and do not drop the table — `select * from public.secrets;` in psql still shows both rows.
Check yourself:  wg check      stuck?  wg hint
