# a policy only applies to the roles in its TO clause
Lesson: "there is a read policy" is not the same as "everyone can read". Every policy carries a list of roles (`to …`), and it is silent for any role not on that list. Two roles hit the API: the anon key runs as `anon`, a logged-in user's JWT runs as `authenticated`. A policy written for one does nothing for the other.
The symptom is the same as having no policy at all: the excluded role gets `200 []`. So when one client sees rows and another does not, check who each one is and who the policy names — before touching `using`.
`pg_policies` shows `roles` as an array. A role list can be changed in place with `alter policy … to …`; the row condition stays as it was.
    select policyname, roles, cmd, qual from pg_policies where tablename='faq';     roles = who it applies to
    alter policy "name" on public.t to anon, authenticated;                         change only the role list
    curl -s "$API_URL/rest/v1/faq" -H "apikey: $ANON_KEY"                          as role anon
Try it first: `select rolname from pg_roles where rolname in ('anon','authenticated','service_role');` — the three API roles, as real Postgres roles.
Your task: "The FAQ shows fine once you log in, but the public landing page (anon key) gets `[]` from `/rest/v1/faq`. Someone already added a read policy, so it's not RLS… right?"
Goal: anon GET returns all 3 FAQ rows. Keep RLS enabled.
Check yourself:  wg check      stuck?  wg hint
