## 1
Realtime `postgres_changes` reads the logical-replication publication `supabase_realtime`. What's in it? `select * from pg_publication_tables where pubname='supabase_realtime';`
## 2
A table that is not part of the publication never produces change events, no matter how the client subscribes. `rooms` is in there, `messages` is not.
## 3
`alter publication supabase_realtime add table public.messages;` (Studio: Database → Publications → toggle the table.)
