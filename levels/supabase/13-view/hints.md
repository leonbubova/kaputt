## 1
A saved query is a view; PostgREST serves views in `public` exactly like tables (`/rest/v1/<view>`). Look at what you have: `\d public.players`, `\dv`.
## 2
`create view public.leaderboard as select name, score from public.players where not banned order by score desc;` — the view is computed on every read, so it always matches `players`.
## 3
`curl -s http://127.0.0.1:54321/rest/v1/leaderboard -H "apikey: $ANON_KEY"`. 404 right after creating it? `notify pgrst, 'reload schema';` — 42501? `grant select on public.leaderboard to anon, authenticated;`
