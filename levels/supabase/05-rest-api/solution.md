    source ~/.k8s-wargame/supabase/env
    curl -s "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY" > ~/.k8s-wargame/supabase/fruits.json
