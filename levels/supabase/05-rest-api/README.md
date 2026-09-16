# the API: every table is a URL
Lesson: a web or phone app never opens psql. It asks the API over HTTP, and the API turns each table into an address:
    http://127.0.0.1:54321/rest/v1/TABLE        →  the rows of public.TABLE, as JSON
Every request must carry the anon key in a header called `apikey`, otherwise the answer is `401`. `curl` is the
command that sends HTTP requests from the terminal; `-H` adds a header, `-s` keeps it quiet.
Try it — there is a table `public.fruits` with 3 rows. Load the keys (lesson 1) and ask the API for it:
    source ~/.k8s-wargame/supabase/env
    curl -s "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY"
You get a JSON list: `[{"id":1,"name":"apple"},…]`. Try it once without the `-H` part to see the `401`.
(In psql the same rows are `select * from public.fruits;` — one database, two doors.)
Your task: save the API's answer into a file. Same curl, with `>` at the end:
    curl -s "$API_URL/rest/v1/fruits" -H "apikey: $ANON_KEY" > ~/.k8s-wargame/supabase/fruits.json
The file must contain the JSON list with all three fruits.
Check yourself:  wg check      stuck?  wg hint
