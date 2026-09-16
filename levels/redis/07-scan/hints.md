## 1
SCAN walks the keys in batches: it answers a cursor and some names. With MATCH it only shows names matching the pattern, and a big COUNT finds it in one or two calls.
## 2
`SCAN 0 MATCH note:* COUNT 500` shows the full key name. `GET` that key, then `SET found` with the value you read.
## 3
    wg shell
    SCAN 0 MATCH note:* COUNT 500
    GET note:hidden-4f2c
    SET found needle
