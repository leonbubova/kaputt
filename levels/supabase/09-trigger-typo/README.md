# a trigger runs a PL/pgSQL function on every row, and NEW is that row
Lesson: a trigger is Postgres running your function automatically on INSERT, UPDATE or DELETE. `before insert … for each row` means: for every new row, call the function first; inside it, `new` is the row about to be written, `new.column` its fields, and `return new` hands the (possibly modified) row on.
A function body is checked loosely at `create` time. References to `new.<field>` are resolved only when the trigger fires — so a wrong field name does not fail at deploy, it fails on the first insert, with `record "new" has no field "…"`. That message is PL/pgSQL's, not PostgREST's; the API relays it as a 400.
Investigation order: which triggers are on the table, which function each calls, what the body references, and whether the table has that column.
    select tgname, tgrelid::regclass, tgfoid::regproc from pg_trigger where not tgisinternal;     triggers and their functions
    \sf public.fn                                                                                   the function body
    \d public.posts                                                                                 the real column names
    create or replace function public.fn() returns trigger language plpgsql as $$ … $$;            replace the body; the trigger keeps pointing at it
Your task: "Every `POST /rest/v1/posts` (service key, `{"title":…,"body":…}`) fails: `record "new" has no field …`. It worked before the slug feature shipped."
Goal: posts can be inserted and get a slug like `hello-world-again` for title `Hello World, Again`. Don't drop the feature.
Check yourself:  wg check      stuck?  wg hint
