# keys that clean up after themselves: EXPIRE and TTL
Lesson: memory is limited, so many keys should not live forever — a login session, a cached page. Redis can
delete a key on its own after a number of seconds. That countdown is the key's *TTL* (time to live).
    EXPIRE key 600        start a countdown: delete this key in 600 seconds. Answers (integer) 1.
    TTL key               seconds left. Two special answers:  -1 = this key never expires   -2 = the key is gone
    SET key value EX 600  write the value and the countdown in one command
A key written with a plain `SET` has TTL -1: it stays until someone deletes it. That is the normal cause of
"Redis keeps growing".
Try it:
    wg shell
    SET demo hi
    TTL demo
    EXPIRE demo 5
    TTL demo
    GET demo
Wait a few seconds and run `GET demo` again — (nil). It deleted itself.
Your task: store the value `bye` under the key `note:temp` and give it a TTL of 600 seconds (anything
between 1 and 3600 passes). Both `GET note:temp` → "bye" and `TTL note:temp` → a positive number must be true.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
