# users: sign up through the API
Lesson: Supabase also manages users and logins — a service called Auth, under `/auth/v1/` of the same API.
An app never stores passwords itself; it sends email + password to Auth, which creates the user and hands back
a token. That token later replaces the anon key in requests, and RLS then knows WHO is asking (the role
`authenticated` instead of `anon`). Users land in the table `auth.users` — a different drawer than `public`.
Signing up is one POST request with a JSON body. Two new curl parts: `-X POST` (send, not fetch) and `-d '…'` (the body):
    curl -s -X POST "$API_URL/auth/v1/signup" -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"email":"someone@example.com","password":"secret-99"}'
The answer is a long JSON with `access_token` and a `user` block — the user exists now.
Try it — look at the (empty) user table in psql (`wg shell`):
    select email, created_at from auth.users;
Your task: sign up the user `lesson@example.com` with the password `wargame-123` via the API (curl as above, from a
terminal where you ran `source ~/.k8s-wargame/supabase/env`). Afterwards the psql query above lists that email.
Check yourself:  wg check      stuck?  wg hint
