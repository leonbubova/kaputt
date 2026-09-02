# a hash is a small record under one key: fields you can read and update one at a time
Lesson: a string holds one value. When an object has several attributes — a user with a name and an age — you could stuff a JSON blob into a string, but then every change means read the whole thing, edit, write it all back.
A hash solves this: one key, many field/value pairs inside it. You can set one field, read one field, or fetch all of them, and Redis handles each field independently. That is the natural shape for profiles, settings, and any "one object with properties" cache.
The value of the key is the whole hash. `TYPE key` tells you it is `hash`, and string commands like `GET` won't work on it.
    HSET user:1 name anna age 30    write one or more fields (creates the hash if needed)
    HGET user:1 name                read a single field
    HGETALL user:1                  dump every field and value
    TYPE user:1                     which kind of value this key holds
Try it first: `HGETALL user:1` — an empty result, the key doesn't exist yet. `TYPE user:1` says `none`.
Your task: the app stores user profiles as a hash. Create `user:1` with fields name=anna and age=30.
Check yourself:  wg check      stuck?  wg hint
