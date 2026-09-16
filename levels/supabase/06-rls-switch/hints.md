## 1
RLS is a per-table switch. Off = the API sees everything; on = the API sees nothing until a policy allows rows. The switch is one SQL statement in psql.
## 2
`alter table public.secrets enable row level security;` — then the curl from the task prints `[]`. Confirm in psql: `select relrowsecurity from pg_class where relname='secrets';` → `t`.
## 3
    alter table public.secrets enable row level security;
