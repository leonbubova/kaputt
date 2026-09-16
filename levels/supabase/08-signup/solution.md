    source ~/.k8s-wargame/supabase/env
    curl -s -X POST "$API_URL/auth/v1/signup" -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"email":"lesson@example.com","password":"wargame-123"}'
