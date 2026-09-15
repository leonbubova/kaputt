## 1
PostgREST only serves schemas listed in `[api] schemas` of `supabase/config.toml` (default: `public`, `graphql_public`). Where does the view live? `\dv *.*` or `select schemaname, viewname from pg_views where viewname='top_articles';`
## 2
Either expose the extra schema (config.toml + restart + `Accept-Profile` header on every request) — or simply put the view where the API looks.
## 3
`alter view wg_analytics.top_articles set schema public;` PostgREST reloads its schema cache on DDL automatically (`notify pgrst, 'reload schema'` if it doesn't).
