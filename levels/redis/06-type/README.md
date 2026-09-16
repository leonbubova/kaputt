# every key has one type: TYPE
Lesson: you have met three kinds of value: a plain text (a *string*), a *hash*, a *list*. A key gets its type from
the command that created it — `SET` makes a string, `HSET` a hash, `RPUSH` a list — and keeps that type until
the key is deleted. Using the wrong command on a key is an error, not a conversion:
    TYPE key            answers string, hash, list, set, … (or none if the key does not exist)
    GET some-list       → (error) WRONGTYPE Operation against a key holding the wrong kind of value
WRONGTYPE means: this key exists, but it is not the kind of value this command works on. The fix is never a
"convert" command — there is none. You `DEL` the key and create it again with the right command.
Try it:
    wg shell
    TYPE thing:a
    TYPE thing:b
    TYPE thing:c
    GET thing:b
Your task: exactly one of `thing:a`, `thing:b`, `thing:c` is a list. Find out which, and store its key name as a
string under the key `answer:list` (for example `SET answer:list thing:x`). Leave the three thing:* keys as they are.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
