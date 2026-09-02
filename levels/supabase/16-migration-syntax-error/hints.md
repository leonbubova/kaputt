## 1
Run it and read the error: `cd ~/.k8s-wargame/supabase/project && supabase db reset`. It names the migration file and the failing statement. Fix, re-run, read again — there may be more than one problem.
## 2
First: `syntax error at or near "NUL"` — typo in `20240902090000_tags.sql`. Second: `insert or update on table "article_tags" violates foreign key constraint` — the seed rows reference an article id that the first migration never inserted (`select id from articles`).
## 3
`NOT NUL` → `NOT NULL`; in the `article_tags` insert replace article `3` with an existing id (1 or 2). `supabase db reset` again.
