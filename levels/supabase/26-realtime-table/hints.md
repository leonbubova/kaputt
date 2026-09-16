## 1
Realtime's `postgres_changes` does not watch tables directly — it reads the logical-replication publication `supabase_realtime`. Which tables are in it? `select * from pg_publication_tables where pubname='supabase_realtime';`
## 2
A table that is not part of the publication produces no change events at all, however the client subscribes. New tables are not added automatically.
## 3
`alter publication supabase_realtime add table public.rooms;` (Studio: Database → Publications → toggle the table.)
