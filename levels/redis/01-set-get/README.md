# your first key: SET and GET
Lesson: Redis is a program that keeps data in memory (RAM, not on disk) — so it is very fast, and everything
in it is reachable by a name. Each name is a *key*, and each key holds one *value*. Think of it as one giant
table with two columns: key → value. You talk to it with a small tool called `redis-cli`: type a command, press
Enter, Redis answers. Two commands for today — `SET` stores a value under a key, `GET` reads it back:
    SET color blue        Redis answers OK
    GET color             Redis answers "blue"
    GET nothing           Redis answers (nil) — that key does not exist. Not an error, just "nothing there".
Try it — open the client (the prompt changes to `127.0.0.1:6379>`, that means "you are talking to Redis"):
    wg shell
    PING
    SET color blue
    GET color
    GET nothing
`PING` answers `PONG` — Redis is alive. Type `exit` to leave the client and get your normal prompt back.
Your task: store the value `hello` under the key `greeting`, so that `GET greeting` answers `"hello"`.
Where: inside `wg shell` (or in one go from your terminal: `docker exec wg-redis redis-cli SET greeting hello`).
Check yourself:  wg check      stuck?  wg hint
