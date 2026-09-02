# TTL -1 is the leak: EXPIRE adds an expiry to a key that already exists
Lesson: a key written with a plain `SET` has no expiry — `TTL key` answers `-1`, "lives forever". For a session store that is a slow memory leak: every login adds a key, nothing ever removes one, and the server grows until it hits its limit.
Redis distinguishes two "no TTL" answers. `-1` means the key exists but never expires; `-2` means the key is gone. When you audit a server, `-1` on keys that should be temporary is the finding.
You don't have to rewrite the value to fix it. `EXPIRE key seconds` attaches a countdown to an existing key and leaves the data untouched; `PERSIST` does the opposite and removes the expiry. Rewriting with `SET` would also reset the value and, without `EX`, would drop any TTL it had.
    TTL session:live               -1 = never expires, -2 = missing, else seconds left
    EXPIRE session:live 3600       start a countdown on an existing key, value unchanged
    PERSIST session:live           remove the expiry again
    GET session:live               confirm the value is still what it was
Try it first: `TTL session:live` versus `TTL session:abc` from the previous level — one of them is `-1`.
Your task: the key `session:live` was written without an expiry, so it persists forever and the session store leaks memory. Give it a TTL (1..3600 seconds) without changing its value.
Check yourself:  wg check      stuck?  wg hint
