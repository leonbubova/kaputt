# a SQL function in an exposed schema is an endpoint under /rpc
Lesson: PostgREST does not only map tables to URLs. Every function in an exposed schema (`public`) becomes `POST /rest/v1/rpc/<function name>`. The JSON body's keys are matched to the function's parameter names, and the return value comes back as JSON. `create function` is the deploy.
The function is ordinary Postgres: `language sql` for a single expression, `language plpgsql` for logic. Parameter names matter — they are the API.
Calling it needs EXECUTE privilege for the calling role; in a Supabase project new functions in `public` get that for `anon` through default privileges, so a plain `create function` is already callable.
PostgREST keeps a cache of the schema. It reloads on DDL by itself; if a function that exists still 404s, ask for a reload.
    create function public.f(x text) returns text language sql as $$ select x $$;     define it
    \sf public.f                                                                       show a function's body (wg shell)
    curl -s -X POST "$API_URL/rest/v1/rpc/f" -H "apikey: $ANON_KEY" -H 'Content-Type: application/json' -d '{"x":"hi"}'
    notify pgrst, 'reload schema';                                                     refresh PostgREST's cache
Try it first: `curl -s "$API_URL/rest/v1/" -H "apikey: $ANON_KEY" | head -c 300` — the OpenAPI description PostgREST builds from the schema.
Your task: "We want a smoke-test endpoint. Create a SQL function `greet(name text)` that returns `'hello, ' || name`, callable by the frontend (anon key) as `POST /rest/v1/rpc/greet` with body `{"name":"wg"}` → `"hello, wg"`."
Goal: that call returns 200 with `"hello, wg"`.
Check yourself:  wg check      stuck?  wg hint
