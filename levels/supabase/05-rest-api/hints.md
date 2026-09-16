## 1
The API address of a table is `$API_URL/rest/v1/<table>`; the anon key travels in the `apikey` header. `curl -s URL -H "apikey: KEY"` prints the answer; `> FILE` puts it into a file instead.
## 2
`$API_URL` and `$ANON_KEY` only exist after `source ~/.k8s-wargame/supabase/env` in the same terminal. If the file is empty or says "No API key found", that step was skipped.
## 3
    source ~/.k8s-wargame/supabase/env
    curl -s "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY" > ~/.k8s-wargame/supabase/fruits.json
