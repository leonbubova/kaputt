# open it up (read-only)
Ticket: "`notes` has RLS enabled (good) and 3 rows. The public frontend uses the anon key and gets `[]` from `GET /rest/v1/notes`. Make notes readable for anonymous visitors — read only, RLS stays on."
Goal: anon GET returns the 3 rows; anon POST is still rejected.
