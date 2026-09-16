# what is supabase? — the local stack
Lesson: Supabase is a ready-made backend: a Postgres database plus small web services around it (an API for
tables, one for users/logins, one for files). `wg start` already started a private copy of all of it on your
machine, in the folder `~/.k8s-wargame/supabase/project`. Each service listens on a local address:
    http://127.0.0.1:54321     the API — programs and curl talk to this
    http://127.0.0.1:54323     Studio — a web page to look at your data (open it in a browser)
Every request to the API needs a key. The stack made two: the anon key (for the public, "anonymous") and the
service role key (for admins, skips all checks). `wg start` wrote the addresses and keys into one file:
    ~/.k8s-wargame/supabase/env
Try it — look at the stack, then load the file into your shell and read one value:
    cd ~/.k8s-wargame/supabase/project
    supabase status
    source ~/.k8s-wargame/supabase/env
    echo $API_URL
`source FILE` runs the lines of the file in your shell, so from now on `$API_URL` and `$ANON_KEY` mean those values.
Your task: put the API address into a file. After the `source` line above, type exactly:
    echo $API_URL > ~/.k8s-wargame/supabase/api-url.txt
The file must contain just the address, `http://127.0.0.1:54321`.
Check yourself:  wg check      stuck?  wg hint
