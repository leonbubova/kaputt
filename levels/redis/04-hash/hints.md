## 1
A hash is several field/value pairs under one key. Writing fields creates the key. You need fields name and kind on `pet:1`.
## 2
`HSET key field value field value` — one command with both pairs. Look at the result with `HGETALL pet:1`.
## 3
    wg shell
    HSET pet:1 name rex kind dog
