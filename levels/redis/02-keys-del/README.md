# see what is there, and remove a key: KEYS and DEL
Lesson: a key stays until somebody removes it. Two commands: `KEYS pattern` lists key names that match a
pattern — `*` means "anything", so `KEYS *` shows every key. `DEL key` removes a key and its value; Redis
answers with how many keys it removed (1, or 0 if there was nothing to remove).
    KEYS *                every key
    KEYS color:*          only keys whose name starts with color:
    DEL color:old         answers (integer) 1 — gone. GET color:old now answers (nil).
Key names are just text. The `:` inside has no special meaning to Redis — people use it to group keys, like
folders: `color:one`, `color:two` belong together.
Try it:
    wg shell
    KEYS *
    KEYS color:*
    GET color:old
Your task: three keys `color:one`, `color:two`, `color:old` exist. Delete `color:old` and nothing else —
`color:one` and `color:two` must keep their values.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
