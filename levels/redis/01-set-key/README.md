# redis is a key-value store: SET writes a string, GET reads it back
Lesson: Redis keeps everything in memory as key → value. A key is just a name; the simplest value is a string. There are no tables, no schema, no files to edit — you talk to the server with commands, and the change is live the moment the command returns.
Reading a key that doesn't exist is not an error. `GET` on a missing key answers `(nil)`, which is why an app "can't read its config" without anything crashing: it asked, and got nothing.
Key names are plain strings. The `app:name` style with colons is only a convention that groups related keys — Redis doesn't care about the colon.
    KEYS *                    list every key on the server (fine on a small dev instance)
    GET app:name              read a string; (nil) means the key does not exist
    SET app:name shop         write a string, creating the key if needed
    EXISTS app:name           1 if the key exists, 0 if not
Try it first: `GET app:name` — it answers `(nil)`. Then `KEYS *` to see what else lives here.
Your task: the service reads a string key `app:name` on boot and expects the value `shop`. Right now the key doesn't exist. Set it.
Check yourself:  wg check      stuck?  wg hint
