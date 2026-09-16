## 1
The env file `~/.k8s-wargame/supabase/env` is a list of `NAME=value` lines. `source` it, and `$API_URL` is the value of the API_URL line: `http://127.0.0.1:54321`.
## 2
Two commands, in this order: `source ~/.k8s-wargame/supabase/env`, then `echo $API_URL > ~/.k8s-wargame/supabase/api-url.txt`. If the file ends up empty, the source line was skipped.
## 3
    source ~/.k8s-wargame/supabase/env
    echo $API_URL > ~/.k8s-wargame/supabase/api-url.txt
