# visitors can't sign the guestbook
"Reading works. But `POST /rest/v1/guestbook` with `{"name":"…","message":"…"}` and the anon key answers `403 new row violates row-level security policy`. There is an insert policy!" Goal: anonymous visitors can insert; they still must not be able to delete anything. RLS stays on.
