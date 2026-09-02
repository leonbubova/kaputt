# chat doesn't update live
"The chat client subscribes with `postgres_changes` on `public.messages`. New rows show up only after a page reload. The same subscription on `public.rooms` works instantly." Goal: inserts into `messages` are broadcast by Realtime (keep `rooms` working too).
