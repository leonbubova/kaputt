## 1
`KEYS *` shows every key name; `DEL name` removes exactly that one key. Only `color:old` should go.
## 2
Inside `wg shell`: `DEL color:old`. Redis answers (integer) 1. `KEYS color:*` afterwards shows only color:one and color:two.
## 3
    wg shell
    DEL color:old
