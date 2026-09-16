## 1
Every key has exactly one type, fixed by the command that created it. Redis tells you the type of any key — you do not have to guess from the name.
## 2
`TYPE thing:a`, `TYPE thing:b`, `TYPE thing:c` — one of them answers list. Then `SET answer:list` with that key name as the value.
## 3
    wg shell
    TYPE thing:c
    SET answer:list thing:c
