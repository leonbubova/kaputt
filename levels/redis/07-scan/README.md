# finding keys safely: SCAN instead of KEYS
Lesson: `KEYS *` looks harmless, but Redis handles one command at a time — while it lists a million keys,
every other client waits. On a real server that is a short outage. The safe way is `SCAN`: it returns a small
batch of keys plus a number (a *cursor*), and you call it again with that number to get the next batch. Cursor
`0` means "start"; when the answer's cursor is `0` again, you have seen everything.
    SCAN 0                        first batch: a cursor, then some key names
    SCAN 0 MATCH note:*           only names matching the pattern (still batch by batch — a batch can be empty)
    SCAN 0 MATCH note:* COUNT 500 ask for bigger batches, fewer calls
Rule: `KEYS` on a laptop for learning, `SCAN` anywhere people depend on the server.
Try it:
    wg shell
    SCAN 0
    SCAN 0 MATCH note:* COUNT 500
Your task: among a few hundred `log:*` keys hides one key whose name starts with `note:`. Find its full name and
store the VALUE of that key as a string under `found` — so `GET found` answers what `GET note:…` answers.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
