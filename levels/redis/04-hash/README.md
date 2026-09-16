# one key, several fields: a hash
Lesson: so far every value was one piece of text. A *hash* is a value made of several named fields — like a
small form: name = rex, kind = dog. It lives under ONE key, and you read or change each field on its own.
    HSET pet:1 name rex kind dog     write fields (field value field value …). Answers how many fields are new.
    HGET pet:1 name                  read one field → "rex"
    HGETALL pet:1                    read every field and value, listed line by line
    HSET pet:1 kind cat              change one field, the others stay
`HSET` creates the key if it does not exist. A key holding a hash does not answer to `GET` — different kind
of value, different commands (lesson 6 says more about that).
Try it:
    wg shell
    HSET demo:pet name rex kind dog
    HGET demo:pet name
    HGETALL demo:pet
Your task: create a hash under the key `pet:1` with exactly two fields: `name` = `rex` and `kind` = `dog`.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
