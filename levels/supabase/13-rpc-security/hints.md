## 1
No error, just 0 — so the function runs, and the SELECT inside it sees no rows. Who is the SELECT running as? `\df+ public.event_count` shows the security mode.
## 2
`SECURITY INVOKER` (default) runs with the caller's role — `anon` — so RLS on `events` filters everything. `SECURITY DEFINER` runs as the function owner, which bypasses those policies. That's exactly the "aggregate over private data" use case.
## 3
`alter function public.event_count() security definer;` (and keep `set search_path = ''`/schema-qualified names in definer functions).
