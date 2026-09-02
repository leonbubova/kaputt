# a key can carry a time-to-live: write value and expiry in one SET
Lesson: by default a Redis key lives until something deletes it. For a session token, a one-time code, a rate-limit window, that is wrong — the data has a natural lifetime, and after that it is garbage taking up memory.
Redis solves this with a TTL (time-to-live) on the key. When the countdown reaches zero, the key deletes itself. No cron job, no cleanup script: the expiry is part of the data.
The cleanest way to set it is at write time. `SET key value EX seconds` stores the value and starts the countdown in one atomic step, so there is never a moment where the key exists without an expiry. `TTL key` shows the seconds left.
    SET session:abc token123 EX 300    write the value and expire it after 300 s
    TTL session:abc                    seconds remaining; -2 = key gone
    GET session:abc                    the value is a normal string until it expires
Try it first: `SET demo x EX 5`, then `TTL demo` a few times — watch it count down, then `GET demo` returns `(nil)`.
Your task: store a session string at `session:abc` with the value `token123`, and give it a time-to-live so it expires on its own (any TTL between 1 and 3600 seconds).
Check yourself:  wg check      stuck?  wg hint
