## 1
Signup is a POST to `$API_URL/auth/v1/signup` with the anon key in the `apikey` header and a JSON body `{"email":"…","password":"…"}`. The `Content-Type: application/json` header tells Auth the body is JSON.
## 2
Copy the curl from the lesson and swap the email and password: `lesson@example.com` / `wargame-123`. Keep every quote exactly — the body is inside single quotes, the values inside double quotes.
## 3
    source ~/.k8s-wargame/supabase/env
    curl -s -X POST "$API_URL/auth/v1/signup" -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"email":"lesson@example.com","password":"wargame-123"}'
