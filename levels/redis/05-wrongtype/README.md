# every key has exactly one type, fixed at creation: WRONGTYPE means the key is not what the app expects
Lesson: a Redis key is a string, or a hash, or a list, or a set — never more than one. The type is decided by the first command that creates the key, and every later command must match it. `LPUSH` on a key that holds a string is refused with `WRONGTYPE Operation against a key holding the wrong kind of value`.
Behind many "the feed stopped working" tickets: some script did a plain `SET` on a key the app treats as a list, and from then on every list command fails.
There is no conversion in place. The fix is always the same shape: confirm the type, delete the key, recreate it with the command that matches the type the app needs.
    TYPE events                    string, hash, list, set — or none
    LPUSH events x                 fails with WRONGTYPE if events is not a list
    DEL events                     remove the key, whatever its type
    RPUSH events a b               recreate it as a list, in order
Try it first: `TYPE events`, then `LPUSH events test` — read the error text.
Your task: the app appends to the list `events`, but the key was created as a plain string, so every push fails with WRONGTYPE. It should be a list holding: signup, login (index 0 = signup).
Check yourself:  wg check      stuck?  wg hint
