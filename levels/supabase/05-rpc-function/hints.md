## 1
PostgREST exposes every function in an exposed schema (`public`) under `/rest/v1/rpc/<name>`; JSON body keys map to named parameters.
## 2
`create function public.greet(name text) returns text language sql as $$ select 'hello, ' || name $$;` — new functions get EXECUTE for anon via the project's default privileges, so no grant needed.
## 3
`curl -s -X POST http://127.0.0.1:54321/rest/v1/rpc/greet -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{"name":"wg"}'`. 404 "could not find function"? PostgREST reloads its schema cache on DDL; if not: `notify pgrst, 'reload schema';`
